package com.example.demo.config;

import com.example.demo.service.serviceImp.MyUserDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

   /* @Autowired
    private MyUserDetailsService myUserDetailsService;*/

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        //super.configure(http);
        //定制请求的授权规则,定义哪些URL需要被保护、哪些不需要被保护
        http.authorizeRequests()
                .antMatchers("/test").permitAll()
                .anyRequest().authenticated();

        //解决在iframe中嵌套拦截的问题
         http.headers().frameOptions().disable();

        //定义当需要用户登录时候，转到的登录页面 /toLogin。
        http.formLogin()
                .loginPage("/login_page").failureUrl("/login_error").permitAll().defaultSuccessUrl("/scanboard");//登录页面不需要验证

        //1.访问/logout表示用户注销，清空session
        //2.开启自动配置的注销功能，定义退出登录后的跳转页，注销成功跳转到/toLogin
        http.logout()
                .logoutSuccessUrl("/scanboard");
        http.csrf().disable();

        http.rememberMe().rememberMeParameter("remember");

    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        //super.configure(auth);
        /*auth.userDetailsService(myUserDetailsService).passwordEncoder(passwordEncoder());*/
        auth.inMemoryAuthentication()
                .passwordEncoder(passwordEncoder())
                .withUser("admin").password(new BCryptPasswordEncoder().encode("123")).roles("administrator")
                .and()
                .withUser("lzc").password(new BCryptPasswordEncoder().encode("123")).roles("projectMember");
    }

    @Bean
    //对密码加密处理
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Override
    public void configure(WebSecurity web) {
        //解决静态资源被拦截的问题
        web.ignoring().antMatchers("/fonts/**","/css/**","/images/**","/js/**","/lay/**","/module/**");
    }
}
