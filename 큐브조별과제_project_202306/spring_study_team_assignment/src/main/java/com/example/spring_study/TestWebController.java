package com.example.spring_study;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;

@RestController
@RequestMapping("/api")
public class TestWebController {

    @GetMapping("/hello")
    public String hello(@RequestParam(value="msg", required = false) String msg){
        return msg;
    }

    @GetMapping("hello2")
    public HashMap<String,String> hello3(){
        HashMap<String,String> map = new HashMap<>(){{
            put("이름","홍길동");
            put("나이","30");
            put("국적","서울");
        }};
        return map;
    }


}
