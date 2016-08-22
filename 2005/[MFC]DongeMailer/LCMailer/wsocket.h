/*
 * Definitions for portable socket class. 
 * 
 * Donge<23donge@gmail.com>
 */

#ifndef _HEGANG_WSOCKET_H_
#define _HEGANG_WSOCKET_H_

#ifdef WIN32
	#include <winsock.h>
//##ModelId=43B25EC002C3
	typedef int				socklen_t;
#else
	#include <sys/socket.h>
	#include <netinet/in.h>
	#include <netdb.h>
	#include <fcntl.h>
	#include <unistd.h>
	#include <sys/stat.h>
	#include <sys/types.h>
	#include <arpa/inet.h>
	typedef int				SOCKET;
	#define INVALID_SOCKET	-1
	#define SOCKET_ERROR	-1
#endif


//##ModelId=43B25EC002EE
class WSocket {

public:
	//##ModelId=43B25EC002FD
	WSocket(SOCKET sock = INVALID_SOCKET);
	//##ModelId=43B25EC002FF
	~WSocket();

	// Create socket
	//##ModelId=43B25EC0030D
	bool Create(int af, int type, int protocol = 0);

	// Connect socket
	//##ModelId=43B25EC0031D
	bool Connect(const char* ip, unsigned short port);

	// Bind socket
	//##ModelId=43B25EC0032E
	bool Bind(unsigned short port);

	// Listen socket
	//##ModelId=43B25EC0033D
	bool Listen(int backlog = 5); 

	// Accept socket
	//##ModelId=43B25EC0034B
	bool Accept(WSocket& s, char* fromip = NULL);

	// Send socket
	//##ModelId=43B25EC0035B
	int Send(const char* buf, int len, int flags = 0);

	// Recv socket
	//##ModelId=43B25EC0036C
	int Recv(char* buf, int len, int flags = 0);
	
	// Close socket
	//##ModelId=43B25EC0037C
	int Close();

	// Get errno
	//##ModelId=43B25EC0038A
	int GetError();

	// Init winsock DLL 
	//##ModelId=43B25EC0038B
	static int Init();	
	// Clean winsock DLL
	//##ModelId=43B25EC00399
	static int Clean();

	// Domain parse
	//##ModelId=43B25EC0039B
	static bool DnsParse(const char* domain, char* ip);

	//##ModelId=43B25EC003AB
	WSocket& operator = (SOCKET s);

	//##ModelId=43B25EC003BA
	operator SOCKET ();

protected:
	//##ModelId=43B25EC003C9
	SOCKET m_sock;

};

#endif

