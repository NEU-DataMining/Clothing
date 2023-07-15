import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.*;

import libsvm.*;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;


import bean.Shop66098091; 
import bean.Shop63703916;
import bean.Shop108678795;
import bean.Shop62206750;
import bean.Shop108266831;
import bean.Shop64372798;
import bean.Shop68996733;
import bean.Shop63721895;
import bean.Shop100163346;
import bean.P1;
public class LibSVMTest {

	/**JAVA test code for LibSVM
	 * @author yangliu
	 * @throws IOException 
	 * @blog http://blog.csdn.net/yangliuy
	 * @mail yang.liu@pku.edu.cn
	 */
	public static void main(String[] args) throws IOException {
		// TODO Auto-generated method stub
		//Test for svm_train and svm_predict
		//svm_train: 
		//	  param: String[], parse result of command line parameter of svm-train
		//    return: String, the directory of modelFile
		//svm_predect:
		//	  param: String[], parse result of command line parameter of svm-predict, including the modelfile
		//    return: Double, the accuracy of SVM classification
		String[] trainArgs = {"product-texture-tra"};//directory of training file
		String modelFile = svm_train.main(trainArgs);
		String predictfile="";
		SessionFactory sf=new Configuration().configure().buildSessionFactory();
		Session session=sf.openSession();
		Transaction tx=session.beginTransaction();
		String hql="from bean.P1 as p order by id asc";
		@SuppressWarnings("unchecked")
		List<P1> list=session.createQuery(hql).list();
		for (Iterator<P1> product = list.iterator();product.hasNext();)
		{
			P1 p=product.next();
			String id=p.getId();
			predictfile="E:\\taobao\\2\\"+id+"texture.txt";
			System.out.println(id);
			String[] testArgs = {predictfile, modelFile, "product-texture-result"};//directory of test file, model file, result file
			String result = svm_predict.main(testArgs);
			p.setTexture(result);
			session.update(p);
		}
		tx.commit();
		session.close();
		sf.close();
		//Test for cross validation
		//String[] crossValidationTrainArgs = {"-v", "10", "UCI-breast-cancer-tra"};// 10 fold cross validation
		//modelFile = svm_train.main(crossValidationTrainArgs);
		//System.out.print("Cross validation is done! The modelFile is " + modelFile);
	}

}
