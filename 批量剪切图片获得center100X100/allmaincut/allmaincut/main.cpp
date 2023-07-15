#include "cut.h"
#include<iostream>
#include<cstdlib>
#include<fstream>
#include<string>
#include<sstream>
#include<windows.h>

using std::cout;
using std::endl;
using std::string;
using std::ostream;
using std::ifstream;
using std::ofstream;
using std::stringstream;

inline ostream & putline(ostream & os, string const & line)
{
	return os << line << endl; 
}

template <class outType, class inType>  
outType convert(const inType & in)  
{  
	stringstream iss;  
	iss << in;
	outType result;  
	iss >> result;  
	return result;      
}
void FindJPG(const string & strDir)
{
	WIN32_FIND_DATA p;
	string stringBuffer;
	HANDLE h=FindFirstFile((strDir + "\\*.jpg").c_str(), &p);
	stringBuffer = strDir + "\\" + string(p.cFileName);
	string str =string(p.cFileName);
    str=str.substr(0,str.length()- 4); //去掉末尾5个字符，为了存储时使用
	cout<<str<<endl;
	str="E:\\taobao\\center1\\"+str+".jpg";//剪切后的保存路径
	const char * s=stringBuffer.c_str();
	const char * s1=str.c_str();
    cut(s,s1);    
	while(FindNextFile(h, &p))
	{
		stringBuffer = strDir + "\\" + string(p.cFileName);
		str =string(p.cFileName);
		str=str.substr(0,str.length()- 4); 

		str="E:\\taobao\\center1\\"+str+".jpg";//剪切后的保存路径
		s=stringBuffer.c_str();
		const char * s1=str.c_str();
		cut(s,s1);
 
	}
}
int main(int argc, char * argv[])
{
	string inPath;
	ifstream in;
	FindJPG("E:\\taobao\\upper");
	system("pause");
	return EXIT_SUCCESS;
}