package by.astd.astd.servcie;

import by.astd.astd.domain.Role;
import by.astd.astd.domain.User;
import by.astd.astd.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.stream.Collectors;

@Service
public class UserService implements UserDetailsService {
    @Autowired
    private UserRepo userRepo;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        return userRepo.findByUsername(username);
    }

    public boolean addUser(Map<String, String> form,
                           User user) {
        User userFromDB = userRepo.findByUsername(user.getUsername());
        if (userFromDB != null) {
            return false;
        }

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

        user.setPassword(passwordEncoder.encode(user.getPassword()));

        userRepo.save(user);
        return true;
    }

    public boolean userSave(User userform,
                            Map<String, String> form,
                            User user) {

        user.setUsername(userform.getUsername());
        user.setFirstname(userform.getFirstname());
        user.setLastname(userform.getLastname());
        user.setPatronymic(userform.getPatronymic());
        user.setPassword(passwordEncoder.encode(userform.getPassword()));
        user.setEmail(userform.getEmail());
        user.setActive(userform.isActive());

        Set<String> roles = Arrays.stream(Role.values())
                .map(Role::name)
                .collect(Collectors.toSet());

        user.getRoles().clear();

        for (String key : form.keySet()) {
            if (roles.contains(key)) {
                user.getRoles().add(Role.valueOf(key));
            }
        }

        userRepo.save(user);
        return true;
    }

    public List<User> findAll() {
        return userRepo.findAll();
    }

    public void delete(User user) {
        userRepo.delete(user);
    }
}

