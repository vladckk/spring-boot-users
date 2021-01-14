package gomel.iba.by;

import gomel.iba.by.exceptions.IncorrectEmailException;
import gomel.iba.by.exceptions.UserAlreadyExistsException;
import gomel.iba.by.exceptions.UserNotFoundException;
import gomel.iba.by.exceptions.ValidationException;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


@RestController
public class UsersController {

    private static final Logger log = Logger.getLogger(UsersController.class);

    @Autowired
    UserRepository userRepository;

    @GetMapping("/")
    public List<User> showUsers(Authentication auth) {
        UserDetails userDetails = (UserDetails) auth.getPrincipal();
        User user = userRepository.findFirstByUsername(userDetails.getUsername()).orElse(null);
        log.info(Role.ADMIN.toString());
        List<User> users;
        if (user.getRole().equals(Role.ADMIN.name())) {
            users = userRepository.findAll();
        } else {
            users = userRepository.findByRole(Role.USER.name());
        }
        return users;
    }

    @PostMapping("/add")
    @PreAuthorize("hasAuthority('permission:write')")
    public User addUser(@RequestBody User user) {
        log.info(user);
        if (userRepository.findFirstByUsername(user.getUsername()).isPresent()) {
            log.info("This user already exists");
            throw new UserAlreadyExistsException();
        }
        if (user.getFullname() == null || user.getMail() == null || user.getPassword() == null || user.getUsername() == null
            || user.getRole() == null || user.getFullname().equals("") || user.getMail().equals("")
                || user.getPassword().equals("") || user.getUsername().equals("")) {
            log.info("Validation error");
            throw new ValidationException();
        }
        if (!checkEmail(user.getMail())) {
            throw new IncorrectEmailException();
        }
        userRepository.save(user);
        user = userRepository.findOne(Example.of(user)).orElse(null);
        if (user != null) {
            log.info("info: user [" + user.getId() + "] created");
        }
        return user;
    }

    @DeleteMapping("/delete/{id}")
    @PreAuthorize("hasAuthority('permission:write')")
    public ResponseEntity<Object> deleteUser(@PathVariable Long id) {
        if (userRepository.findById(id).isPresent()) {
            userRepository.deleteById(id);
        } else {
            log.info("User wasn't found");
            throw new UserNotFoundException();
        }
        return ResponseEntity.noContent().build();
    }

    public static boolean checkEmail(String email) {
        Pattern pattern = Pattern.compile("[a-zA-Z0-9]+?@\\w+?\\.\\w+");
        Matcher matcher = pattern.matcher(email);
        boolean check = false;
        if (matcher.find()) {
            check = true;
        }
        return check;
    }
}
