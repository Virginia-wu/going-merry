package com.virginia.goingmerry.web.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Author wujy , 2018/8/15
 */
@RestController
@RequestMapping
public class DemoController {

    @GetMapping("/")
    public String home() {
        return "going-merry: hello world";
    }
}
