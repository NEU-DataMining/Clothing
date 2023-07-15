#include<iostream>
#include<cstdlib>
#include<fstream>
#include<string>
#include<sstream>
#include<windows.h>
#include <opencv/cv.h>
#include <opencv/highgui.h>
#include <opencv/cxcore.h>

#include <stdio.h> 
#include <stdlib.h>
#include<string>
#include <assert.h> 
#include <math.h> 
#include <float.h> 
#include <limits.h> 
#include <time.h> 
#include <ctype.h>

#ifdef _EiC 
#define WIN32 
#endif
using namespace std;
using std::cout;
using std::endl;
using std::string;
using std::ostream;
using std::ifstream;
using std::ofstream;
using std::stringstream;


static CvMemStorage* storage = 0; 
static CvHaarClassifierCascade* cascade = 0;

void detect_and_draw( IplImage* image ,string str);

const char* cascade_name = 
"D:/SDDAPP/opencv/sources/data/haarcascades/haarcascade_frontalface_alt.xml"; 
/*    "haarcascade_profileface.xml";*/


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
    str=str.substr(0,str.length()- 4); //ȥ��ĩβ4���ַ���Ϊ�˴洢ʱʹ��
	str="E:\\sleevecut\\"+str+".jpg";//���к�ı���·��
	const char * s=stringBuffer.c_str();
	cout << stringBuffer << endl;
	IplImage* image = cvLoadImage( s, 1 );
  
if( image ) 
    { 
		
        detect_and_draw( image ,str); 
        cvWaitKey(0); 
        cvReleaseImage( &image );   
    }
     cvDestroyWindow("result"); 
	while(FindNextFile(h, &p))
	{
		stringBuffer = strDir + "\\" + string(p.cFileName);
		str =string(p.cFileName);
		str=str.substr(0,str.length()- 4); 
		str="E:\\sleevecut\\"+str+".jpg";//���к�ı���·��
		s=stringBuffer.c_str();
		cout << stringBuffer << endl;
		IplImage* image = cvLoadImage( s, 1 );
  
if( image ) 
    { 
		
        detect_and_draw( image,str ); 
        cvWaitKey(0); 
        cvReleaseImage( &image );   
    }
     cvDestroyWindow("result"); 
	}
}

int main( int argc, char** argv ) 
{ 

    cascade_name = "D:/SDDAPP/opencv/sources/data/haarcascades/haarcascade_frontalface_alt2.xml"; 
    cascade = (CvHaarClassifierCascade*)cvLoad( cascade_name, 0, 0, 0 ); 
  
    if( !cascade ) 
    { 
        fprintf( stderr, "ERROR: Could not load classifier cascade\n" ); 
        return -1; 
    } 
    storage = cvCreateMemStorage(0); 
    cvNamedWindow( "result", 1 ); 
    string inPath;
	ifstream in;
	inPath ="E:\\sleevegrabcut";//����ͼƬ·��
	FindJPG(inPath);
}


void detect_and_draw(IplImage* img,string str) 
{ 
	IplImage * copy_img=NULL;
    double scale=1; //����1.2
    static CvScalar colors[] = { 
        {{0,0,255}},{{0,128,255}},{{0,255,255}},{{0,255,0}}, 
        {{255,128,0}},{{255,255,0}},{{255,0,0}},{{255,0,255}} 
    };//Just some pretty colors to draw with

    //Image Preparation 
    // 
    IplImage* gray = cvCreateImage(cvSize(img->width,img->height),8,1); 
    IplImage* small_img=cvCreateImage(cvSize(cvRound(img->width/scale),cvRound(img->height/scale)),8,1); 
    cvCvtColor(img,gray, CV_BGR2GRAY); 
    cvResize(gray, small_img, CV_INTER_LINEAR);

    cvEqualizeHist(small_img,small_img); //ֱ��ͼ����

    //Detect objects if any 
    // 
    cvClearMemStorage(storage); 
    double t = (double)cvGetTickCount(); 
    CvSeq* objects = cvHaarDetectObjects(small_img, cascade, storage, 1.1, 2,  0/*CV_HAAR_DO_CANNY_PRUNING*/,  cvSize(30,30));
    t = (double)cvGetTickCount() - t; 
    printf( "detection time = %gms\n", t/((double)cvGetTickFrequency()*1000.) );
        CvRect* r=(CvRect*)cvGetSeqElem(objects,0); 
        //cvRectangle(img, cvPoint(r->x*scale,r->y*scale), cvPoint((r->x+r->width)*scale,(r->y+r->height)*scale), colors[0%8]); //����������
		//cvRectangle(img, cvPoint((r->x-0.7*r->width)*scale,(r->y+1.2*r->height)*scale), cvPoint((r->x)*scale,(r->y+2.2*r->height)*scale), colors[0%8]); //������
		//cvRectangle(img, cvPoint((r->x+r->width)*scale,(r->y+1.2*r->height)*scale), cvPoint((r->x+1.7*r->width)*scale,(r->y+2.2*r->height)*scale), colors[0%8]);//�Ҽ����
		//cvRectangle(img, cvPoint((r->x-0.2*r->width)*scale,(r->y+1.2*r->height)*scale), cvPoint((r->x+1.2*r->width)*scale,(r->y+1.8*r->height)*scale), colors[0%8]); //���Ӿ���
		//cvRectangle(img, cvPoint((r->x-0.2*r->width)*scale,(r->y+1.8*r->height)*scale), cvPoint((r->x+1.2*r->width)*scale,(r->y+3.8*r->height)*scale), colors[0%8]); //���Ӿ���
		//cvRectangle(img, cvPoint((r->x-100)*scale,(r->y+r->height)*scale), cvPoint((r->x+200)*scale,(r->y+r->height+300)*scale), colors[0%8]); //�·�����
		/*�·��м�
		cvSetImageROI(img,cvRect(r->x-0.2*r->width,r->y+1.8*r->height,1.4*r->width,2*r->height));
		copy_img=cvCreateImage(cvSize(1.4*r->width,2*r->height),  IPL_DEPTH_8U, img->nChannels); //��ͷ��С������
		*/
		if((r->height)>=64&&(0.7*r->width)>=64)
		{
			cvSetImageROI(img,cvRect(r->x-0.7*r->width,r->y+1.2*r->height,0.7*r->width,r->height));
		    copy_img=cvCreateImage(cvSize(0.7*r->width,r->height),  IPL_DEPTH_8U, img->nChannels); //��ͷ��С������
		}
		else
		{
			if((0.7*r->width)>=64)
			{
			    cvSetImageROI(img,cvRect(r->x-0.7*r->width,r->y+1.2*r->height,0.7*r->width,64));
		        copy_img=cvCreateImage(cvSize(0.7*r->width,64),  IPL_DEPTH_8U, img->nChannels); //��ͷ��С������
			}
			else
			{
				cvSetImageROI(img,cvRect(r->x-0.7*r->width,r->y+1.2*r->height,64,64));
		        copy_img=cvCreateImage(cvSize(64,64),  IPL_DEPTH_8U, img->nChannels); //��ͷ��С������
			}
		}
		/*����
		cvSetImageROI(img,cvRect(r->x-100,r->y+r->height,300,300));
		copy_img=cvCreateImage(cvSize(300,300),  IPL_DEPTH_8U, img->nChannels);*/

		//cvSetImageROI(img,cvRect(r->x-100,r->y+r->height,300,300));
		//copy_img=cvCreateImage(cvSize(300,300),  IPL_DEPTH_8U, img->nChannels);
		cvCopy(img,copy_img,0);
		cvResetImageROI(img);
   // cvShowImage( "result", img ); 
	//cvShowImage("���г���������",copy_img);
	const char * s=str.c_str();
	cvSaveImage(s, copy_img);
	cvWaitKey(0);
    cvReleaseImage(&gray); 
    cvReleaseImage(&small_img); 
	
}