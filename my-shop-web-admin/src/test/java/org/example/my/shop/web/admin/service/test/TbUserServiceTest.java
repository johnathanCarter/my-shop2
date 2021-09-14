package org.example.my.shop.web.admin.service.test;


import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.example.my.shop.domain.TbUser;
import org.example.my.shop.web.admin.service.TbUserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.util.DigestUtils;

import java.util.*;
import java.util.function.Consumer;
import java.util.stream.Stream;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring-context.xml", "classpath:spring-context-druid.xml", "classpath:spring-context-mybatis.xml"})
public class TbUserServiceTest {
    @Autowired
    private TbUserService tbUserService;

    @Test
    public void testSelectAll() {
        List<TbUser> tbUserList = tbUserService.selectAll();
        for (TbUser user : tbUserList) {
            System.out.println(user.getUsername());
        }
    }

    @Test
    public void testJackson() {
        try {
            List<TbUser> tbUserList = tbUserService.selectAll();
            ObjectMapper mapper = new ObjectMapper();
            String s = mapper.writeValueAsString(tbUserList);
            System.out.println(s);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
    }

    @Test
    public void testRegister() {
        TbUser user = new TbUser();
        user.setUsername("1234@qq.com");
        user.setPassword(DigestUtils.md5DigestAsHex("1245*fuI)+-N.,gso34".getBytes()));
        user.setPhone("12344556");
        user.setEmail("123@qq.com");
        tbUserService.save(user);
    }

    @Test
    public void testDelete() {
        tbUserService.delete(8L);
    }

    @Test
    public void testSelect() {
        TbUser tbUser = tbUserService.selectById(1L);
        System.out.println(tbUser.getUsername() + "\n" + tbUser.getEmail());
    }

    @Test
    public void testUpdate() {
        TbUser user = tbUserService.selectById(2L);
        user.setUsername("carl");
        user.setUpdated(new Date());
        user.setEmail("124098@qq.com");
        user.setPassword(DigestUtils.md5DigestAsHex("12345".getBytes()));
        tbUserService.update(user);
    }

    @Test
    public void testS() {
        TbUser user = new TbUser();
        user.setUsername("jack");
        user.setPassword("123");
        user.setEmail("123@sda.com");

        if (user.getUsername() != null)
            System.out.println(1);
        if (user.getPassword() != null)
            System.out.println(2);
        if (user.getEmail() != null)
            System.out.println(3);
    }

    @Test
    public void test02() {
        abstract class Shape {
            void draw() {
                System.out.println(this + ".draw()");
            }

            @Override
            public abstract String toString();
        }
        class Circle extends Shape {
            @Override
            public String toString() {
                return "Circle";
            }
        }
        class Square extends Shape {
            @Override
            public String toString() {
                return "Square";
            }
        }
        class Triangle extends Shape {
            @Override
            public String toString() {
                return "Triangle";
            }
        }

        Stream.of(new Circle(), new Square(), new Triangle()).forEach(Shape::draw);

    }


    public int[] towSum(int[] list, int target) {
        Map<Integer, Integer> map = new HashMap<>();
        for(int i = 0; i < list.length; i++) {
            int num = target - list[i];
            if (map.containsKey(num)) {
                return new int[] {map.get(num), i};
            } else {
                map.put(list[i], i);
            }
        }
        return null;
    }

    @Test
    public void test() {
        int[] list = {1,2,3,4,5,6,1};
        int target = 11;
        for (int key: towSum(list, target)) {
            System.out.println(key);
        }
    }

    @Test
    public void test01() {
        int[] list = {2, 3, 1, 0, 2, 5, 3};
        int distinguish = distinguish(list);
        System.out.println(distinguish);
    }

    @Test
    public void test03() {
        int[][] list = {
                {1, 4, 7, 11, 15},
                {2, 5, 8, 12, 19},
                {3, 6, 9, 16, 22},
                {10, 13, 14, 17, 24},
                {18, 21, 23, 26, 30}
        };
        System.out.println(twoDem(list, 20));
    }

    public boolean twoDem(int[][] list, int key) {
        for (int i = 0; i < list.length; i++) {
            for (int n = 0; n < list[i].length; n++) {
                if (list[i][n] == key) {
                    return true;
                }
            }
        }
        return false;
    }

    public int distinguish(int[] list) {
        for (int i = 0; i < list.length; i++) {
            int element = list[i];
            if (i != element) {
                if (element != list[element]) {
                    list[i] = list[element];
                    list[element] = element;
                } else if (element == list[element]) {
                    return element;
                }
            }
        }
        return -1;
    }
}