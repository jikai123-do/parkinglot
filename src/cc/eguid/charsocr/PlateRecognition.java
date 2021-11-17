package cc.eguid.charsocr;

import java.io.File;
import java.util.Vector;

import org.bytedeco.javacpp.opencv_core.Mat;
import org.bytedeco.javacpp.opencv_imgcodecs;

import cc.eguid.charsocr.core.CharsRecognise;
import cc.eguid.charsocr.core.PlateDetect;

/**
 * 车牌识别
 * 
 * @author eguid
 *
 */
public class PlateRecognition {
	static PlateDetect plateDetect = null;
	static CharsRecognise cr = null;
	static {
		plateDetect = new PlateDetect();
		plateDetect.setPDLifemode(true);
		cr = new CharsRecognise();
	}

	/**
	 * 单个车牌识别
	 * 
	 * @param mat
	 * @return
	 */
	public static String plateRecognise(Mat mat) {
		Vector<Mat> matVector = new Vector<Mat>(1);
		if (0 == plateDetect.plateDetect(mat, matVector)) {
			if (matVector.size() > 0) {
				return cr.charsRecognise(matVector.get(0));
			}
		}
		return null;
	}

	/**
	 * 多车牌识别
	 * 
	 * @param mat
	 * @return
	 */
	public static String[] mutiPlateRecognise(Mat mat) {
		PlateDetect plateDetect = new PlateDetect();
		plateDetect.setPDLifemode(true);
		Vector<Mat> matVector = new Vector<Mat>(10);
		if (0 == plateDetect.plateDetect(mat, matVector)) {
			CharsRecognise cr = new CharsRecognise();
			String[] results = new String[matVector.size()];
			for (int i = 0; i < matVector.size(); ++i) {
				String result = cr.charsRecognise(matVector.get(i));
				results[i] = result;
			}
			return results;
		}
		return null;
	}

	/**
	 * 单个车牌识别
	 * 
	 * @param mat
	 * @return
	 */
	public static String plateRecognise(String imgPath) {
		Mat src = opencv_imgcodecs.imread(imgPath);
		return plateRecognise(src);
	}

	/**
	 * 多车牌识别
	 * 
	 * @param mat
	 * @return
	 */
	public static String[] mutiPlateRecognise(String imgPath) {
		Mat src = opencv_imgcodecs.imread(imgPath);
		return mutiPlateRecognise(src);
	}

	public static void main(String[] args) {

		String imgPath = "res/image/test_image/chars_segment.jpg";
		Mat src = opencv_imgcodecs.imread(imgPath);
		String ret = plateRecognise(src);
		System.out.println(ret);

	}
	public String getPlate() {
		String imgPath = "res/image/test_image/chars_segment.jpg";
		Mat src = opencv_imgcodecs.imread(imgPath);
		String ret = plateRecognise(src);
		return ret;
	}
}
