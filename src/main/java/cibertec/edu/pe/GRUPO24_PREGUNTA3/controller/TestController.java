package cibertec.edu.pe.GRUPO24_PREGUNTA3.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("api/v1/test")
public class TestController {

    @GetMapping
    public String testJenkins(){
        return "Hola Jenkins";
    }
}
