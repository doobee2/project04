package kr.ed.haebeop.config;

import com.fasterxml.jackson.databind.ObjectMapper;
import kr.ed.haebeop.service.*;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@ComponentScan(basePackages = "kr.ed.haebeop")
public class ApplicationConfig {



    // Chat
    @Bean
    public ObjectMapper mapper() { return new ObjectMapper(); }

    // Service
    @Bean
    public MemberService memberService() {return new MemberServiceImpl();}

    public MemberMgnService memberMgnService() {return new MemberMgnServiceImpl();}

    @Bean
    public CommentService commentService() {return new CommentServiceImpl();}

    @Bean
    public LectureService lectureService() {return new LectureServiceImpl();}

    @Bean
    public PaymentService paymentService() {return new PaymentServiceImpl();}


}