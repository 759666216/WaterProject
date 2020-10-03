package com.example.demo.service.serviceImp;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;


@Service
public class MyUserDetailsService implements UserDetailsService {
    @Override
    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
        return null;
    }


    /**
     * 授权的时候是对角色授权，而认证的时候应该基于资源，而不是角色，因为资源是不变的，而用户的角色是会变的
     */

    /*@Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        SysUser sysUser = sysUserService.getUserByName(username);
        if (sysUser == null) {
            throw new UsernameNotFoundException(username+"用户名不存在");
        }
        SysRole sysRole =sysRoleService.selectByRoleid(sysUser.getRoleid());
        SimpleGrantedAuthority authoritie = new SimpleGrantedAuthority(sysRole.getCharacter());
        List<SimpleGrantedAuthority> authorities = new ArrayList<>();
        authorities.add(authoritie);
        return new User(sysUser.getUsername(), sysUser.getPassword(),authorities);
        *//*Collection<GrantedAuthority> authorities = new ArrayList<>();
        authorities.add(new SimpleGrantedAuthority("administrator"));
        return new User("admin", new BCryptPasswordEncoder().encode("qwe123"), authorities);*//*
    }*/
}
