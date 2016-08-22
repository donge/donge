/*
 * Definitions for POP3 interfaces. 
 *
 * HeGang<dchg2000@mail.com>
 */

#ifndef _HEGANG_POP3_H_
#define _HEGANG_POP3_H_

#include "wsocket.h"

//##ModelId=43B25EC20399
class CPop3 {

public:
	//##ModelId=43B25EC203A9
	CPop3();
	//##ModelId=43B25EC203AA
	~CPop3();

	// Init POP3 attributes 
	//##ModelId=43B25EC203B9
	bool Create(const char* username, const char* userpwd, const char* svraddr, 
				unsigned short port = 110);
	
	// Connect POP3 server
	//##ModelId=43B25EC203CA
	bool Connect();

	// Login server
	//##ModelId=43B25EC203D8
	bool Login();

	// List mail
	//##ModelId=43B25EC203D9
	bool List(int& sum);
	
	// Fetch mail
	//##ModelId=43B25EC30001
	bool Fetch(char* buf, int num = 1);
	//##ModelId=43B25EC30010
	bool FetchEx(int num = 1);

	// Quit
	//##ModelId=43B25EC3001F
	bool Quit();

	// Get subject 
	//##ModelId=43B25EC30020
	bool GetSubject(char* subject, const char* buf);

	// Write file
	//##ModelId=43B25EC30030
	static bool WriteFile(const char* filename, const char* buffer, unsigned int len);

protected:
	//##ModelId=43B25EC3004E
	int GetMailSum(const char* buf);

	//##ModelId=43B25EC3005E
	WSocket m_sock;
	//##ModelId=43B25EC3006D
	char m_username[32];
	//##ModelId=43B25EC3007D
	char m_userpwd[32];
	//##ModelId=43B25EC3008C
	char m_svraddr[32];
	//##ModelId=43B25EC3009C
	unsigned short m_port;

private:
	//##ModelId=43B25EC300AB
	int Pop3Recv(char* buf, int len, int flags = 0);

};

#endif

