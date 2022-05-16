package vn.codegym.springdemo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import vn.codegym.springdemo.entity.Book;
import vn.codegym.springdemo.entity.Category;
import vn.codegym.springdemo.service.BookService;
import vn.codegym.springdemo.service.CategoryService;

@Controller
@RequestMapping("/book")
public class BookController {
    @Autowired
    BookService bookService;

    @Autowired
    CategoryService categoryService;

    @GetMapping("create")
    public String displayCreate(Model model) {
        Book book = new Book();
        book.setCategory(new Category());
        model.addAttribute("book", book);
        model.addAttribute("categories", categoryService.findAll());
        return "book/create";
    }

    @PostMapping("create")
    public String create(@ModelAttribute("book") Book book, Model model) {
        bookService.create(book);
        return "redirect:/book/list";
    }

    @GetMapping("list")
    public String showListBook(@RequestParam(name = "nameBook", required = false) String name, Model model) {
        if (name != null && !name.isEmpty()) {
            model.addAttribute("books", bookService.findByName(name));
        } else {
            model.addAttribute("books", bookService.getList());
        }
        return "book/list";
    }

    @GetMapping("listPaging")
    public String showListBookPaging(
            @RequestParam(name = "page", required = false, defaultValue = "1") int page,
            @RequestParam(name = "size", required = false, defaultValue = "3") int size,
            @RequestParam(name = "sort", required = false, defaultValue = "ASC") String sort,
            Model model) {
        Sort order = null;
        if (sort.equals("ASC")) {
            order = Sort.by("name").ascending();
        } else if (sort.equals("DESC")) {
            order = Sort.by("name").descending();
        }

        Pageable pageable = PageRequest.of(page - 1, size, order);

        model.addAttribute("books", bookService.findAll(pageable));
        return "book/list";
    }

    @GetMapping("detail/{id}")
    public String showDetail(@PathVariable("id") int book_id, Model model) {
        model.addAttribute("book", bookService.findById(book_id));
        return "book/detail";
    }

    @GetMapping("detail2/{id}")
    public String showDetail2(@PathVariable("id") Book book, Model model) {
        model.addAttribute("book", book);
        return "book/detail";
    }
}
