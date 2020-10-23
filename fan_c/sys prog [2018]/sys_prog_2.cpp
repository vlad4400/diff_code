#include <windows.h>
#include <stdio.h>
#include <iostream>
#include <accctrl.h> 
#include <aclapi.h> 

using namespace std;

int main()
{
	char* lpMapAddress;
	HANDLE File = CreateFile("file1.txt",
		GENERIC_READ | GENERIC_WRITE,
		FILE_SHARE_READ | FILE_SHARE_WRITE,
		NULL,
		OPEN_EXISTING,
		FILE_ATTRIBUTE_NORMAL,
		NULL);

	PSECURITY_DESCRIPTOR pSD = NULL;
	PSID Sid = NULL;
	char buffer[257];
	DWORD size = 258;
	SID_NAME_USE type_of_SID;
	DWORD dwLengthOfDomainName = 0;
	ACL *lpDacl;
	DWORD dwDaclLength;
	PACL lpNewDacl;
	EXPLICIT_ACCESS ea;
	SECURITY_ATTRIBUTES sa;

	InitializeSecurityDescriptor(&pSD, size);

	GetUserName(buffer, &size);
	LookupAccountName(NULL, buffer, &Sid, &size, NULL, &dwLengthOfDomainName, &type_of_SID);
	SetSecurityDescriptorOwner(&pSD, Sid, FALSE);
	SetSecurityDescriptorGroup(&pSD, Sid, FALSE);

	dwDaclLength = sizeof(ACL)
		+ sizeof(ACCESS_ALLOWED_ACE) - sizeof(DWORD) + size
		+ sizeof(ACCESS_DENIED_ACE) - sizeof(DWORD) + size;
	lpDacl = (ACL*)new char[dwDaclLength];
	InitializeAcl(lpDacl, dwDaclLength, ACL_REVISION);

	AddAccessDeniedAce(lpDacl, ACL_REVISION, GENERIC_READ, Sid);

	SetSecurityDescriptorDacl(&pSD, TRUE, lpDacl, FALSE);

	sa.nLength = sizeof(sa);
	sa.lpSecurityDescriptor = &pSD;
	sa.bInheritHandle = FALSE;

	HANDLE hMapFile = CreateFileMapping(File,
		NULL,
		PAGE_READWRITE,
		0,
		0,
		"MyFileMappingObject");
	if (hMapFile == NULL)
	{
		printf("Could not create file-mapping object.\n");
	}
	lpMapAddress = (char*)MapViewOfFile(hMapFile,
		FILE_MAP_ALL_ACCESS,
		0,
		0,
		0);
	int sizeFile = GetFileSize(File, 0);
	int sum = 0;
	for (int i = 0; i < sizeFile; i++)
	{
		if (lpMapAddress[i] == '\n')
		{
			cout << "The sume char in ASSCI of line: " << sum << '\n';
			sum = 0;
		}
		sum = sum + lpMapAddress[i];
	}
	cout << "The sume char in ASSCI of line: " << sum;
	if (lpMapAddress == NULL)
	{
		printf("Could not map view of file.\n");
	}
	hMapFile = OpenFileMapping(FILE_MAP_ALL_ACCESS,
		FALSE,
		"MyFileMappingObject");
	if (hMapFile == NULL)
	{
		printf("Could not open file-mapping object.\n");
	}

	if (!UnmapViewOfFile(lpMapAddress))
	{
		printf("Could not unmap view of file.\n");
	}

	if (lpMapAddress == NULL)
	{
		printf("Could not map view of file.\n");
	}

	CloseHandle(hMapFile);


	if (!FlushViewOfFile(lpMapAddress, 10))
	{
		printf("\n\nCould not flush memory to disk.\n");
	}
	getchar();

	return 0;
}
