#include<iostream>
#include<cstdlib>
#include<fstream>
#include<string>
#include<sstream>
#include<windows.h>
#include <opencv/cv.h>
#include <opencv/highgui.h>
#include <opencv/cxcore.h> 
#include "grabcutbyfile.h"
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
    str=str.substr(0,str.length()- 4); //去掉末尾4个字符，为了存储时使用
	const char * s=str.c_str();
	cout << stringBuffer << endl;
	string filename = stringBuffer;
    Mat image = imread( filename, 1 );
    const string winName = "image";
    namedWindow( winName, WINDOW_AUTOSIZE );
    setMouseCallback( winName, on_mouse, 0 );
    gcapp.setImageAndWinName( image, winName );
    gcapp.showImage();

    for(;;)
    {
        int c = waitKey(0);
        switch( (char) c )
        {
        case '\x1b':
            cout << "Exiting ..." << endl;
            goto exit_main;
        case 'r':
            cout << endl;
            gcapp.reset();
            gcapp.showImage();
            break;
		case 's':
			gcapp.saveImage(s);
			break;
        case 'n':
            int iterCount = gcapp.getIterCount();
            cout << "<" << iterCount << "... ";
            int newIterCount = gcapp.nextIter();
            if( newIterCount > iterCount )
            {
                gcapp.showImage();
                cout << iterCount << ">" << endl;
            }
            else
               cout << "rect must be determined>" << endl;
            break;
        }
    }

exit_main:
    destroyWindow( winName );

	while(FindNextFile(h, &p))
	{
		stringBuffer = strDir + "\\" + string(p.cFileName);
		str =string(p.cFileName);
		str=str.substr(0,str.length()- 4); 
		s=str.c_str();
		cout << stringBuffer << endl;
		filename = stringBuffer;
        image = imread( filename, 1 );
        namedWindow( winName, WINDOW_AUTOSIZE );
        setMouseCallback( winName, on_mouse, 0 );
        gcapp.setImageAndWinName( image, winName );
        gcapp.showImage();

        for(;;)
		{
			int c = waitKey(0);
			switch( (char) c )
			{
			case '\x1b':
				cout << "Exiting ..." << endl;
				goto exit;
            case 'r':
                cout << endl;
                gcapp.reset();
                gcapp.showImage();
				break;
		    case 's':
				
			    gcapp.saveImage(s);
			    break;
            case 'n':
                int iterCount = gcapp.getIterCount();
                cout << "<" << iterCount << "... ";
                int newIterCount = gcapp.nextIter();
                if( newIterCount > iterCount )
                {
					gcapp.showImage();
                    cout << iterCount << ">" << endl;
                }
                else
					cout << "rect must be determined>" << endl;
				break;
			}
		}
exit:
		destroyWindow( winName );
	}
}
int main(int argc, char * argv[])
{
	string inPath;
	ifstream in;
	inPath ="E:\\旗袍";
	FindJPG(inPath);
	return 0;
}
