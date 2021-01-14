package gomel.iba.by.security;

import gomel.iba.by.Role;
import gomel.iba.by.User;
import gomel.iba.by.UserRepository;
import gomel.iba.by.exceptions.UserNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {

    @Autowired
    UserRepository userRepository;

    @Override
    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
        User user = userRepository.findFirstByUsername(s).orElse(null);
        if (user ==  null) {
            throw new UserNotFoundException();
        }
        return new org.springframework.security.core.userdetails.User(user.getUsername(),
                user.getPassword(), Role.valueOf(user.getRole()).getAuthorities());
    }
}
