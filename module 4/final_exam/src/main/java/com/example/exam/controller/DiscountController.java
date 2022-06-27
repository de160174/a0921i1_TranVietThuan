package com.example.exam.controller;


import com.example.exam.model.Discount;
import com.example.exam.service.DiscountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.util.Optional;

@Controller
public class DiscountController {
    @Autowired
    DiscountService discountService;
    @GetMapping("/listDiscount")
    public String listDiscount(Model model,
                               @RequestParam("s") Optional<String> s,
                               @RequestParam(name = "page", required = false, defaultValue = "0") int page,
                               @RequestParam(name = "size", required = false, defaultValue = "3") int size,
                               @RequestParam(name = "sort", required = false, defaultValue = "ASC") String sort) {
        Sort order = null;
        if (sort.equals("ASC")) {
            order = Sort.by("name").ascending();
        } else if (sort.equals("DESC")) {
            order = Sort.by("name").descending();
        }
        Pageable pageable = PageRequest.of(page, size, order);
        Page<Discount> discountPage;
        if (s.isPresent()) {
            discountPage = discountService.findAllByNameContaining(s.get(), pageable);
        } else {
            discountPage = discountService.findAll(pageable);
        }
        model.addAttribute("listDiscount", discountPage);
        return "/discount/list";
    }
    @GetMapping("/showCreateDiscount")
    public ModelAndView showCreateDiscount() {
        return new ModelAndView("/discount/create", "discount", new Discount());
    }

    @PostMapping("/createDiscount")
    public String createDiscount(@Valid @ModelAttribute Discount discount,
                                 BindingResult bindingResult,
                                 RedirectAttributes redirectAttributes) {
        if (bindingResult.hasErrors()){
            return "/discount/create";
        }
        discountService.save(discount);
        redirectAttributes.addFlashAttribute("success", "Add success : "
                + discount.getName());
        return "redirect:/listDiscount";
    }
    @GetMapping("/edit/{id}")
    public ModelAndView showEditForm(@PathVariable int id) {
        Discount discount = discountService.findById(id);
        ModelAndView modelAndView = new ModelAndView("/discount/edit");
        modelAndView.addObject("discount", discount);
        return modelAndView;
    }

    @PostMapping("/edit")
    public String edit(@Valid @ModelAttribute Discount discount,
                       BindingResult bindingResult,
                       RedirectAttributes redirectAttributes) {
        if (bindingResult.hasErrors()){
            return "/discount/edit";
        }
        discountService.save(discount);
        redirectAttributes.addFlashAttribute("success", "Update " +
                discount.getName() + " successfully");
        return "redirect:/listDiscount";
    }
    @GetMapping("/delete/{id}")
    public ModelAndView deleteDiscount(@PathVariable int id, Model model) {
        Discount discount = discountService.findById(id);
        ModelAndView modelAndView = new ModelAndView("/discount/delete");
        modelAndView.addObject("discount", discount);
        return modelAndView;
    }

    @PostMapping("/delete")
    public String deleteDiscount(@ModelAttribute Discount discount, RedirectAttributes redirect) {
        discountService.delete(discount.getId());
        redirect.addFlashAttribute("success", "Removed discount successfully!");
        return "redirect:/listDiscount";
    }

    @PostMapping("/searchByName")
    public String searchByName(@RequestParam String name, Model model,
                               @RequestParam(name = "page", required = false, defaultValue = "0") int page,
                               @RequestParam(name = "size", required = false, defaultValue = "3") int size,
                               @RequestParam(name = "sort", required = false, defaultValue = "ASC") String sort) {
        Pageable pageable = PageRequest.of(page, size);
        Page<Discount> discountPage;
        discountPage = discountService.findAllByNameContaining(name, pageable);
        model.addAttribute("listDiscount", discountPage);
        return "/discount/list";
    }

    @PostMapping("/searchByStartDate")
    public String searchByStartDate(@RequestParam String startDate, Model model,
                                    @RequestParam(name = "page", required = false, defaultValue = "0") int page,
                                    @RequestParam(name = "size", required = false, defaultValue = "3") int size,
                                    @RequestParam(name = "sort", required = false, defaultValue = "ASC") String sort) {
        Pageable pageable = PageRequest.of(page, size);
        Page<Discount> discountPage;
        discountPage = discountService.findAllByStartDateContaining(startDate, pageable);
        model.addAttribute("listDiscount", discountPage);
        return "/discount/list";
    }

    @PostMapping("/searchByEndDate")
    public String searchByEndDate(@RequestParam String endDate, Model model,
                                  @RequestParam(name = "page", required = false, defaultValue = "0") int page,
                                  @RequestParam(name = "size", required = false, defaultValue = "3") int size,
                                  @RequestParam(name = "sort", required = false, defaultValue = "ASC") String sort) {
        Pageable pageable = PageRequest.of(page, size);
        Page<Discount> discountPage;
        discountPage = discountService.findAllByEndDateContaining(endDate, pageable);
        model.addAttribute("listDiscount", discountPage);
        return "/discount/list";
    }
}