package com.codegym.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CurrencyController {
    @RequestMapping(value = "/convert", method = RequestMethod.GET)
    public String convert(@RequestParam String usd, Model model) {
        double vnd = Double.parseDouble(usd) * 23000;
        model.addAttribute("vnd", vnd);
        return "result";
    }
}