package by.astd.astd.controller;

import by.astd.astd.domain.Role;
import by.astd.astd.domain.User;
import by.astd.astd.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

@Controller
@PreAuthorize("hasAuthority('ADMIN')")
public class UserAddController {
    @Autowired
    private UserRepo userRepo;

    @GetMapping("/userAdd")
    public String registration(Model model) {
        model.addAttribute("roles", Role.values());
        return "userAdd";
    }

    @PostMapping("/userAdd")
    public String addUser(@RequestParam Map<String, String> form,
                          User user,
                          Model model) {
        User userFromDB = userRepo.findByUsername(user.getUsername());

        if (userFromDB != null) {
            model.addAttribute("message", "Такой поьзователь уже существует");
            return "userAdd";
        }

        user.setActive(true);

        Set<String> roles = Arrays.stream(Role.values())
                .map(Role::name)
                .collect(Collectors.toSet());

        Set<Role> userRoles = new HashSet<Role>();
        for (String key : form.keySet()) {
            if (roles.contains(key)) {
                userRoles.add(Role.valueOf(key));
            }
            user.setRoles(userRoles);
        }

        userRepo.save(user);

        return "redirect:/user";
    }
}
