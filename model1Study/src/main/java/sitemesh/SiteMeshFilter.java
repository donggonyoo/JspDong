package sitemesh;

import javax.servlet.annotation.WebFilter;

import org.sitemesh.builder.SiteMeshFilterBuilder;
import org.sitemesh.config.ConfigurableSiteMeshFilter;

/*
 *1.sitemesh 패지키생성
 *2.SiteMeshFilter클래스파일 생성
 *
 * sitemesh의 기능 : 화면에 layout페이지 구현해 jsp페이지 적용하는 프레임워크
 * 
 * filter의 기능 : servlet 이전에 먼저실행해 request나 response객체를 변경할수있는기능
 */
@WebFilter("/*") //url mapping /* : 모든요청시 필터적용
public class SiteMeshFilter  extends ConfigurableSiteMeshFilter{
	@Override
	protected void applyCustomConfiguration(SiteMeshFilterBuilder builder) {
		//layout페이지의 위치정보 설정
		// /member/*  :http://localhost:8080/model1Study/member/이하 모든 요청시
		//      /layout/layout.jsp페이지를  layout페이지로 설정
		//addDecoratorPath(url,decorator페이지) : layout설정
		//addExcludedPath(url) : layout페이지를 제외시켜라
		
		builder.addDecoratorPath("/member/*", "/layout/layout.jsp")
		.addExcludedPath("/member/picture*");
		//member하위의 picture로시작하는 이름을가진파일은 제외
	}
}
