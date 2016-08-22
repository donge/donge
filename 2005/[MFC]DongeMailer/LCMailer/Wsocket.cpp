/*
 * Source file about portable socket class.
 *
 * Donge<23donge@gmail.com>
 */

#include "StdAfx.h"

#include <stdio.h>
#include <iostream.h>
#include "wsocket.h"
//#include <socket.h>

#ifdef WIN32
	#pragma comment(lib, "wsock32")
#endif


//##ModelId=43B25EC002FD
WSocket::WSocket(SOCKET sock)
{
	m_sock = sock;
}

//##ModelId=43B25EC002FF
WSocket::~WSocket()
{
}

//##ModelId=43B25EC0038B
int WSocket::Init()
{
#ifdef WIN32
	WSADATA wsaData;
	WORD version = MAKEWORD(2, 0);
	int ret = WSAStartup(version, &wsaData);
	if ( ret ) {
		cerr << "Initilize winsock error !" << endl;
		return -1;
	}
#endif

	return 0;
}

//##ModelId=43B25EC00399
int WSocket::Clean()
{
#ifdef WIN32
		return (WSACleanup());
#endif
		return 0;
}

//##ModelId=43B25EC003AB
WSocket& WSocket::operator = (SOCKET s)
{
	m_sock = s;
	return (*this);
}

//##ModelId=43B25EC003BA
WSocket::operator SOCKET ()
{
	return m_sock;
}

//##ModelId=43B25EC0030D
bool WSocket::Create(int af, int type, int protocol)
{
	m_sock = socket(af, type, protocol);
	if ( m_sock == INVALID_SOCKET ) {
		return false;
	}
	return true;
}

//##ModelId=43B25EC0031D
bool WSocket::Connect(const char* ip, unsigned short port)
{
	struct sockaddr_in svraddr;
	svraddr.sin_family = AF_INET;
	svraddr.sin_addr.s_addr = inet_addr(ip);
	svraddr.sin_port = htons(port);
	int ret = connect(m_sock, (struct sockaddr*)&svraddr, sizeof(svraddr));
	if ( ret == SOCKET_ERROR ) {
		return false;
	}
	return true;
}

//##ModelId=43B25EC0032E
bool WSocket::Bind(unsigned short port)
{
	struct sockaddr_in svraddr;
	svraddr.sin_family = AF_INET;
	svraddr.sin_addr.s_addr = INADDR_ANY;
	svraddr.sin_port = htons(port);

	int opt =  1;
	if ( setsockopt(m_sock, SOL_SOCKET, SO_REUSEADDR, (char*)&opt, sizeof(opt)) < 0 )
		return false;

	int ret = bind(m_sock, (struct sockaddr*)&svraddr, sizeof(svraddr));
	if ( ret == SOCKET_ERROR ) {
		return false;
	}
	return true;
}

//##ModelId=43B25EC0033D
bool WSocket::Listen(int backlog)
{
	int ret = listen(m_sock, backlog);
	if ( ret == SOCKET_ERROR ) {
		return false;
	}
	return true;
}

//##ModelId=43B25EC0034B
bool WSocket::Accept(WSocket& s, char* fromip)
{
	struct sockaddr_in cliaddr;
	socklen_t addrlen = sizeof(cliaddr);
	SOCKET sock = accept(m_sock, (struct sockaddr*)&cliaddr, &addrlen);
	if ( sock == SOCKET_ERROR ) {
		return false;
	}

	s = sock;
	if ( fromip != NULL )
		sprintf(fromip, "%s", inet_ntoa(cliaddr.sin_addr));

	return true;
}

//##ModelId=43B25EC0035B
int WSocket::Send(const char* buf, int len, int flags)
{
	int bytes;
	int count = 0;

	while ( count < len ) {

		bytes = send(m_sock, buf + count, len - count, flags);
		if ( bytes == -1 || bytes == 0 )
			return -1;
		count += bytes;
	}

	return count;
}

//##ModelId=43B25EC0036C
int WSocket::Recv(char* buf, int len, int flags)
{
	return (recv(m_sock, buf, len, flags));
}

//##ModelId=43B25EC0037C
int WSocket::Close()
{
#ifdef WIN32
	return (closesocket(m_sock));
#else
	return (close(m_sock));
#endif
}

//##ModelId=43B25EC0038A
int WSocket::GetError()
{
#ifdef WIN32
	return (WSAGetLastError());
#else
	return (errno);
#endif
}

//##ModelId=43B25EC0039B
bool WSocket::DnsParse(const char* domain, char* ip)
{
	struct hostent* p;
	if ( (p = gethostbyname(domain)) == NULL )
		return false;

	sprintf(ip,
		"%u.%u.%u.%u",
		(unsigned char)p->h_addr_list[0][0],
		(unsigned char)p->h_addr_list[0][1],
		(unsigned char)p->h_addr_list[0][2],
		(unsigned char)p->h_addr_list[0][3]);

	return true;
}

