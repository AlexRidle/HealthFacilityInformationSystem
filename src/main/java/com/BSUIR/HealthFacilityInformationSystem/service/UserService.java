package com.BSUIR.HealthFacilityInformationSystem.service;

import com.BSUIR.HealthFacilityInformationSystem.domain.Role;
import com.BSUIR.HealthFacilityInformationSystem.domain.User;
import com.BSUIR.HealthFacilityInformationSystem.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Collections;

@Service
public class UserService implements UserDetailsService {
    private final UserRepository userRepository;

    @Autowired
    public UserService(final UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Override
    public UserDetails loadUserByUsername(final String username) throws UsernameNotFoundException {
        return userRepository.findByUsername(username);
    }

    public boolean addUser(User user) {
        if (userRepository.findByUsername(user.getUsername()) != null ||
                userRepository.findByEmail(user.getEmail()) != null) {
            return false;
        }

        if(user.getUsername().equals("root")){
            user.setRoles(Collections.singleton(Role.ADMIN));
        } else {
            user.setRoles(Collections.singleton(Role.USER));
        }
        userRepository.save(user);

        return true;
    }
}
