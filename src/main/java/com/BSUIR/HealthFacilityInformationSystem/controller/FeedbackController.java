package com.BSUIR.HealthFacilityInformationSystem.controller;

import com.BSUIR.HealthFacilityInformationSystem.domain.Feedback;
import com.BSUIR.HealthFacilityInformationSystem.domain.NewsPost;
import com.BSUIR.HealthFacilityInformationSystem.domain.User;
import com.BSUIR.HealthFacilityInformationSystem.domain.dto.CaptchaResponseDto;
import com.BSUIR.HealthFacilityInformationSystem.repository.FeedbackRepository;
import com.BSUIR.HealthFacilityInformationSystem.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.time.LocalDateTime;
import java.util.Collections;
import java.util.List;
import java.util.Map;

@Controller
public class FeedbackController {
    private static final String CAPTCHA_URL = "https://www.google.com/recaptcha/api/siteverify?secret=%s&response=%s";

    private final UserService userService;

    private final RestTemplate restTemplate;

    private final FeedbackRepository feedbackRepository;

    @Value("${recaptcha.secret}")
    private String secret;

    @Autowired
    public FeedbackController(final UserService userService, final RestTemplate restTemplate, final FeedbackRepository feedbackRepository) {
        this.userService = userService;
        this.restTemplate = restTemplate;
        this.feedbackRepository = feedbackRepository;
    }

    @GetMapping("/feedback")
    @PreAuthorize("hasAnyAuthority('ADMIN','OPERATOR')")
    public String feedback(Model model){
        List<Feedback> feedbacks = feedbackRepository.findAll();
        Collections.reverse(feedbacks);
        model.addAttribute("feedbacks", feedbacks);
        return "feedback";
    }

    @GetMapping("/feedback/delete/{feedback}")
    @PreAuthorize("hasAnyAuthority('ADMIN','OPERATOR')")
    public String deletePost(RedirectAttributes redirectAttributes, @PathVariable Feedback feedback) {
        try {
            feedbackRepository.delete(feedback);
            redirectAttributes.addFlashAttribute("response", "success");
            return "redirect:/feedback";
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("response", "error");
            return "redirect:/feedback";
        }
    }

    @GetMapping("/support")
    @PreAuthorize("isAuthenticated()")
    public String support(){
        return "support";
    }

    @PostMapping("/support")
    @PreAuthorize("isAuthenticated()")
    public String addFeedback(@RequestParam("g-recaptcha-response") String captchaResponse,
                          @AuthenticationPrincipal User user,
                          @Valid Feedback feedback,
                          BindingResult bindingResult,
                          Model model){
        String url = String.format(CAPTCHA_URL, secret, captchaResponse);
        CaptchaResponseDto response = restTemplate.postForObject(url, Collections.emptyList(), CaptchaResponseDto.class);

        if(bindingResult.hasErrors()){
            Map<String, String> errorsMap = ControllerUtils.getErrors(bindingResult);
            model.mergeAttributes(errorsMap);
            model.addAttribute("feedback", feedback);
            return "support";
        } else {
            if(!response.isSuccess()){
                model.addAttribute("response", "captcha");
                model.addAttribute("feedback", feedback);
                return "support";
            }
            try {
                feedback.setFeedbackDate(LocalDateTime.now().plusHours(3));
                feedback.setUser(user);
                feedbackRepository.save(feedback);
                model.addAttribute("response", "success");
                model.addAttribute("feedback", null);
                return "support";
            } catch (Exception e){
                model.addAttribute("response", "error");
                model.addAttribute("feedback", feedback);
                return "support";
            }
        }
    }
}
