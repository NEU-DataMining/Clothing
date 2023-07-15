#include <opencv/cv.h>  
#include <opencv/highgui.h>  
#include <opencv/cxcore.h>

//��ȡͼ��
void cut(const char * pic2,const char * mainpic2)
{
 IplImage* src=cvLoadImage(pic2,1);
 CvSize size= cvSize(100,100);//�����С
 cvSetImageROI(src,cvRect(101,101,size.width,size.height)); 
 IplImage* dst = cvCreateImage(size,src->depth,src->nChannels);//����Ŀ��ͼ��
 cvCopy(src,dst); //����ͼ��
 cvResetImageROI(src);//Դͼ����������ROI
 cvSaveImage(mainpic2,dst);//����Ŀ��ͼ��

}