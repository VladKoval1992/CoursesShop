package net.kovalchuk.courseshop.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
    @Autowired
    private UserDetailsService userDetailsService;

    @Autowired
    public void registerGlobalAuthentication(AuthenticationManagerBuilder auth) throws Exception {
        auth
                .userDetailsService(userDetailsService)
                .passwordEncoder(getShaPasswordEncoder());
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .csrf().disable()
                .authorizeRequests()
                .antMatchers("/admin").hasRole("ADMIN")
                .antMatchers("/adminall").hasRole("ADMIN")
                .antMatchers("/admincourses").hasRole("ADMIN")
                .antMatchers("/lettersalluser").hasRole("ADMIN")
                .antMatchers("/ordersadmin").hasRole("ADMIN")
                .antMatchers("/ordersalluser").hasRole("ADMIN")
                .antMatchers("/letters").hasRole("ADMIN")
                .antMatchers("/search").hasRole("ADMIN")
                .antMatchers("/search_courses").hasRole("ADMIN")
                .antMatchers("/admincourses").permitAll()
                .antMatchers("/registercourses").permitAll()
                .antMatchers("/register").permitAll()
                .and()
        .exceptionHandling().accessDeniedPage("/unauthorized")
                .and()
        .formLogin()
                .loginPage("/login")
                .loginProcessingUrl("/j_spring_security_check")
                .failureUrl("/login?error")
                .usernameParameter("j_login")
                .passwordParameter("j_password")
                .permitAll()
                .and()
        .logout()
                .permitAll()
                .logoutUrl("/logout")
                .logoutSuccessUrl("/")
                .invalidateHttpSession(true);
    }

    private ShaPasswordEncoder getShaPasswordEncoder(){
        return new ShaPasswordEncoder();
    }
}
