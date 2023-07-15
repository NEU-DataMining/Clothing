#include <opencv/cv.h>  
#include <opencv/highgui.h>  
#include <opencv/cxcore.h>

//截取图像
void cut(const char * pic2,const char * mainpic2)
{
 IplImage* src=cvLoadImage(pic2,1);
 CvSize size= cvSize(100,100);//区域大小
 cvSetImageROI(src,cvRect(101,101,size.width,size.height)); 
 IplImage* dst = cvCreateImage(size,src->depth,src->nChannels);//创建目标图像
 cvCopy(src,dst); //复制图像
 cvResetImageROI(src);//源图像用完后，清空ROI
 cvSaveImage(mainpic2,dst);//保存目标图像

}