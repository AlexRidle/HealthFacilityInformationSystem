package com.BSUIR.HealthFacilityInformationSystem.domain;

import org.springframework.security.core.GrantedAuthority;

public enum Role implements GrantedAuthority {
    USER, OPERATOR, DOCTOR, ADMIN;

    @Override
    public String getAuthority() {
        return name();
    }
}
