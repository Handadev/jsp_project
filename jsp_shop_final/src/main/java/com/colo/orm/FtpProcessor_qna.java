package com.colo.orm;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.SocketException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.colo.domain.ProductImgVO;
import com.colo.domain.ProductVO;
import com.colo.domain.QnaImgVO;
import com.colo.domain.QnaVO;
import com.colo.domain.ReviewImgVO;
import com.colo.domain.ReviewVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class FtpProcessor_qna {
	private static Logger logger = LoggerFactory.getLogger(FtpProcessor_qna.class);
	private final String URL = "hustle.dothome.co.kr";
	private final String ID = "hustle";
	private final String PWD = "anfdmavy93*";
	private final int PORT = 21;
	private FTPClient ftp;
	FileInputStream fis;
	ArrayList<String> uploadedFileNameList;

	public FtpProcessor_qna() {
		ftp = new FTPClient(); // FTP 사용객체 생성
		ftp.setControlEncoding("UTF-8"); // 문자 코드 및 명령어 인코딩
	}

	public ProductVO saveFile(HttpServletRequest req) {
		int maxSize = 1024 * 1024 * 3; // 3MB
		String realPath = req.getServletContext().getRealPath("/localshop/");
		File dir = new File(realPath);
		if (!dir.exists())
			dir.mkdirs();

		ArrayList<File> savedImages = new ArrayList<>();

		try {
			MultipartRequest multi = new MultipartRequest(req, realPath, maxSize, "UTF-8",
					new DefaultFileRenamePolicy());
			Enumeration files = multi.getFileNames(); // 파일객체 순서화
			while (files.hasMoreElements()) {
				String item = (String) files.nextElement(); // 파일객체 정보 가져오기
				String fileName = multi.getFilesystemName(item); // 그 객체에서 파일이름 추출

				if (fileName != null) { // 파일이름 추출을 성공하면
					File file = new File(realPath + fileName); // 경로+파일이름으로 파일객체 생성
					if (file.exists()) { // 생성에 성공하면
						savedImages.add(file); // 파일객체를 리스트에 저장=>ftp로 업로드 예정
					}
				}
			}
			int isUp = upload(savedImages, realPath);
			return isUp > 0 ? new ProductVO(multi.getParameter("category"), multi.getParameter("brand"),
					multi.getParameter("title"), multi.getParameter("content"), String.join(",", uploadedFileNameList),
					Integer.parseInt(multi.getParameter("price")), Integer.parseInt(multi.getParameter("price")) / 100)
					: null;

		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	public ProductVO modifyFile(HttpServletRequest req, int pno) {
		int maxSize = 1024 * 1024 * 3; // 3MB
		String realPath = req.getServletContext().getRealPath("/localshop/");
		File dir = new File(realPath);
		if (!dir.exists())
			dir.mkdirs();

		ArrayList<File> savedImages = new ArrayList<>();

		try {
			MultipartRequest multi = new MultipartRequest(req, realPath, maxSize, "UTF-8",
					new DefaultFileRenamePolicy());
			Enumeration files = multi.getFileNames(); // 파일객체 순서화
			while (files.hasMoreElements()) {
				String item = (String) files.nextElement(); // 파일객체 정보 가져오기
				String fileName = multi.getFilesystemName(item); // 그 객체에서 파일이름 추출

				if (fileName != null) { // 파일이름 추출을 성공하면
					File file = new File(realPath + fileName); // 경로+파일이름으로 파일객체 생성
					if (file.exists()) { // 생성에 성공하면
						savedImages.add(file); // 파일객체를 리스트에 저장=>ftp로 업로드 예정
					}
				}
			}
			int isUp = upload(savedImages, realPath);
			// isUp = 1 잘 들어옴
			return isUp > 0 ? new ProductVO(pno, multi.getParameter("category"), multi.getParameter("brand"),
					multi.getParameter("title"), multi.getParameter("content"), String.join(",", uploadedFileNameList),
					Integer.parseInt(multi.getParameter("price")), Integer.parseInt(multi.getParameter("price")) / 100)
					: null;

		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	private int upload(ArrayList<File> savedImages, String realPath) {
		int result = 1;
		uploadedFileNameList = new ArrayList<>();
		try {
			ftp.connect(URL, PORT);
			ftp.login(ID, PWD);
			ftp.enterLocalPassiveMode(); // 명령어 체계로 진행
			ftp.changeWorkingDirectory("/html/shop"); // 업로드 폴더 설정
			ftp.setFileType(FTP.BINARY_FILE_TYPE); // 파일깨짐방지

			try {
				for (File image : savedImages) {
					fis = new FileInputStream(image); // ftp 전송용 파일객체로 변환
					logger.info(">>> image name : " + image.getName());
					String uploadFileName = make_curr_time() + "_" + image.getName();
					result *= ftp.storeFile(uploadFileName, fis) ? 1 : 0;
					uploadedFileNameList.add(uploadFileName);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				fis.close();
			}

		} catch (SocketException e) {
			logger.error("%%% jvm 네트워크 소켓 설정 오류");
			e.printStackTrace();
		} catch (IOException e) {
			logger.error("%%% 파일전송 FTP 객체 오류");
			e.printStackTrace();
		} finally {
			try {
				ftp.disconnect();
				return result;
			} catch (IOException e) {
				logger.error("%%% 파일전송 FTP 객체 오류");
				e.printStackTrace();
			}
		}
		return 0;
	}

	private String make_curr_time() {
		long curr_time = System.currentTimeMillis();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		return sdf.format(new Date(curr_time));
	}

	public boolean delete(List<ProductImgVO> list) {
		int isDel = 1;
		try {
			ftp.connect(URL, PORT);
			ftp.login(ID, PWD);
			ftp.enterLocalPassiveMode(); // 명령어 체계로 진행
			ftp.changeWorkingDirectory("/html/shop"); // 삭제할 폴더 설정
			ftp.setFileType(FTP.BINARY_FILE_TYPE); // 파일깨짐방지

			for (ProductImgVO ivo : list) {
				isDel *= ftp.deleteFile(ivo.getPd_iname()) ? 1 : 0;
			}
		} catch (SocketException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				ftp.disconnect();
				return isDel == 1 ? true : false;
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return false;
	}

	// QnA content 저장
	public QnaVO qnaSaveContent(MultipartRequest multi) {

		return new QnaVO(multi.getParameter("qna_category"), multi.getParameter("qna_content"),
				multi.getParameter("qna_pwd"), multi.getParameter("qna_writer"),
				Integer.parseInt(multi.getParameter("pno")));

	}

	// QnA imgfile 저장
	public String qnaSaveFile(MultipartRequest multi, String realPath) {
		int isUp = 0;
		ArrayList<File> savedImages = new ArrayList<>();
		Enumeration files = multi.getFileNames();
		while (files.hasMoreElements()) {
			String item = (String) files.nextElement(); // 파일객체 정보 가져오기
			String fileName = multi.getFilesystemName(item); // 그 객체에서 파일이름 추출
			if (fileName != null) { // 파일이름 추출을 성공하면
				File file = new File(realPath + fileName); // 경로+파일이름으로 파일객체 생성
				if (file.exists()) { // 생성에 성공하면
					savedImages.add(file); // 파일객체를 리스트에 저장=>ftp로 업로드 예정
				}
			}
			isUp = upload(savedImages, realPath);
		}
		return isUp > 0 ? String.join(",", uploadedFileNameList) : null;
	}

	// QnA imgfile 삭제
	public boolean QnaDeleteFile(List<QnaImgVO> list) {
		int isDel = 1;
		try {
			ftp.connect(URL, PORT);
			ftp.login(ID, PWD);
			ftp.enterLocalPassiveMode(); // 명령어 체계로 진행
			ftp.changeWorkingDirectory("/html/shop"); // 삭제할 폴더 설정
			ftp.setFileType(FTP.BINARY_FILE_TYPE); // 파일깨짐방지
			for (QnaImgVO qivo : list) {
				isDel *= ftp.deleteFile(qivo.getQna_iname()) ? 1 : 0;
			}
		} catch (SocketException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				ftp.disconnect();
				return isDel == 1 ? true : false;
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return false;
	}

	// Review content 저장
	public ReviewVO revSaveContent(MultipartRequest multi) {

		return new ReviewVO(multi.getParameter("rev_content"), multi.getParameter("rev_writer"),
				Integer.parseInt(multi.getParameter("pno")));
	}

	// Review imgfile 저장
	public String revSaveFile(MultipartRequest multi, String realPath) {
		int isUp = 0;
		ArrayList<File> savedImages = new ArrayList<>();
		Enumeration files = multi.getFileNames();
		while (files.hasMoreElements()) {
			String item = (String) files.nextElement(); // 파일객체 정보 가져오기
			String fileName = multi.getFilesystemName(item); // 그 객체에서 파일이름 추출
			if (fileName != null) { // 파일이름 추출을 성공하면
				File file = new File(realPath + fileName); // 경로+파일이름으로 파일객체 생성
				if (file.exists()) { // 생성에 성공하면
					savedImages.add(file); // 파일객체를 리스트에 저장=>ftp로 업로드 예정
				}
			}
			isUp = upload(savedImages, realPath);
			logger.info("isUp!!!!" + isUp);
			logger.info("!!!!!item!!!!  ======" + item);
			logger.info("!!!!!fileName!!!!  ======" + fileName);
		}
		return isUp > 0 ? String.join(",", uploadedFileNameList) : null;
	}

	// Review imgfile 삭제
	public boolean RevDeleteFile(List<ReviewImgVO> list) {
		int isDel = 1;
		try {
			ftp.connect(URL, PORT);
			ftp.login(ID, PWD);
			ftp.enterLocalPassiveMode(); // 명령어 체계로 진행
			ftp.changeWorkingDirectory("/html/shop"); // 삭제할 폴더 설정
			ftp.setFileType(FTP.BINARY_FILE_TYPE); // 파일깨짐방지
			for (ReviewImgVO rivo : list) {
				isDel *= ftp.deleteFile(rivo.getRev_iname()) ? 1 : 0;
			}
		} catch (SocketException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				ftp.disconnect();
				return isDel == 1 ? true : false;
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return false;
	}

}
