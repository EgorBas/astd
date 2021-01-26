package by.asuod.domain;

import org.springframework.security.core.GrantedAuthority;

public enum Role implements GrantedAuthority {
    OPERATOR, SERVICE_MANAGER,ADMIN;

    @Override
    public String getAuthority() {
        return name();
    }
}
