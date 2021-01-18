package by.astd.astd.controller;

import by.astd.astd.domain.Role;
import by.astd.astd.domain.User;
import by.astd.astd.servcie.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
@PreAuthorize("hasAuthority('ADMIN')")
public class UserAddController {
    @Autowired
    private UserService userService;

    @GetMapping("/userAdd")
    public String registration(Model model) {
        model.addAttribute("roles", Role.values());
        return "userAdd";
    }

    @PostMapping("/userAdd")
    public String addUser(@RequestParam Map<String, String> form,
                          User user,
                          Model model) {
        if (!userService.addUser(form, user)) {
            model.addAttribute("message", "Поьзователь с таким логином уже существует");
            return "userAdd";
        }
        return "redirect:/user";
    }
}
