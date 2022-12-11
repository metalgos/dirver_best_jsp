package com.upload.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.Scanner;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
//@RequestMapping("/mp3")
public class Mp3Controller { //mp3 결과를 텍스트로 저장

	// @RequestMapping("/readresult")
	@ResponseBody
	public String readtxt(String uploadPath) {

		String txt_dir = "\\vid_test_result"; // 경로 설정

		String inFilePath = uploadPath + txt_dir + "\\test_result.txt";
		String outFilePath = uploadPath + txt_dir + "\\test_result2.txt";

		String returnstr = "";

		// nioCopy(inFilePath, outFilePath); //파일 복사

		if (!new File(txt_dir).exists()) {
			new File(txt_dir).mkdirs();
			System.out.println("파일 경로 생성");
		}

		Scanner scanner;
		try {
			// scanner = new Scanner(new File(outFilePath)); //텍스트 파일을 복사한후 이용할경우
			scanner = new Scanner(new File(inFilePath));

			while (scanner.hasNext()) {// 공백으로 구분된 문자열 읽기
				String str = scanner.next();

				String[] cityArr = str.split("\\\\");// \ 텍스트 문자열 구분하기
				for (int i = 0; i < cityArr.length; i++) {

					if (i == (cityArr.length - 2)) { // 아이디 뽑아내기 나중에 쿼리문으로 db에 졸음운전 추가할시 사용
						if(!cityArr[i].equals("video")) { //아이디 경로에 video 임시 폴더 경로가 들어갈경우 실행 안함
						String tempstr = cityArr[i];
						}
					}

					if (i == (cityArr.length - 1)) { // 경로의 마지막 파일 이름 뽑기
						System.out.println("딥러닝 결과 텍스트 일기. 최종 파일 뽑아내기 : " + cityArr[i]);
						returnstr = cityArr[i];
					}
				}

			}

		} catch (FileNotFoundException e) {
			System.out.println("판정결과 파일읽기 실패");
			e.printStackTrace();
		}
		return returnstr;
	}

	public boolean nioCopy(String inFilePath, String outFilePath) { //파일복사용. 사용 임시 중지
		File orgFile = new File(inFilePath);
		File outFile = new File(outFilePath);

		try {
			Files.copy(orgFile.toPath(), outFile.toPath(), StandardCopyOption.REPLACE_EXISTING);
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

}
