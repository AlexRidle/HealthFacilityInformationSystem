package com.BSUIR.HealthFacilityInformationSystem.controller;

import com.BSUIR.HealthFacilityInformationSystem.domain.NewsPost;
import com.BSUIR.HealthFacilityInformationSystem.domain.User;
import com.BSUIR.HealthFacilityInformationSystem.repository.NewsPostRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Controller
public class MainController {
    private final NewsPostRepository newsPostRepository;

    @Value("${upload.path}")
    private String uploadPath;

    @Autowired
    public MainController(final NewsPostRepository newsPostRepository) {
        this.newsPostRepository = newsPostRepository;
    }

    @GetMapping("/")
    public String greeting(Map<String, Object> model) {
        return "greeting";
    }

    @GetMapping("/news")
    public String main(@RequestParam(required = false, defaultValue = "") String filter, Model model) {
        final List<NewsPost> newsPosts;
        if (filter == null || filter.isEmpty()) {
            newsPosts = newsPostRepository.findAll();
        } else {
            newsPosts = newsPostRepository.findByTag(filter);
        }
        Collections.reverse(newsPosts);
        model.addAttribute("newsPosts", newsPosts);
        model.addAttribute("filter", filter);
        return "news";
    }

    @GetMapping("/news/delete/{post}")
    public String deletePost(@PathVariable NewsPost post) {
        try{
            newsPostRepository.delete(post);
        } catch (Exception ignored){
        }
        return "redirect:/news";
    }

    @PostMapping("/news")
    public String add(
            @AuthenticationPrincipal User user,
            @Valid NewsPost newsPost,
            BindingResult bindingResult,
            @RequestParam("file") MultipartFile file,
            Model model
            ) throws IOException {
        newsPost.setAuthor(user);

        if(bindingResult.hasErrors()){
            Map<String, String> errorsMap = ControllerUtils.getErrors(bindingResult);
            model.mergeAttributes(errorsMap);
        } else {
            if (file != null && !file.getOriginalFilename().isEmpty()) {
                final File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdir();
                }
                final String uuidFile = UUID.randomUUID().toString();
                final String resultFilename = uuidFile + "." + file.getOriginalFilename();
                file.transferTo(new File(uploadPath + "/" + resultFilename));
                newsPost.setFilename(resultFilename);
            }
            newsPostRepository.save(newsPost);
        }

        final List<NewsPost> newsPosts = newsPostRepository.findAll();
        Collections.reverse(newsPosts);
        model.addAttribute("newsPosts", newsPosts);
        model.addAttribute("newsPost", newsPost);
        return "news";
    }
}