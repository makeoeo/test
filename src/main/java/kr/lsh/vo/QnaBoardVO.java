package kr.lsh.vo;

import java.util.Date;

import lombok.Data;


@Data
public class QnaBoardVO {
	
	private int bno;
	private String title;
	private String content;
	private String writer;
	private Date regdate;
	private int hit;
	
}
