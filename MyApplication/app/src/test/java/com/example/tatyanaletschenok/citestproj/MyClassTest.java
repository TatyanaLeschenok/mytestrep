package com.example.tatyanaletschenok.citestproj;

import junit.framework.Assert;
import junit.framework.TestCase;

import org.junit.Test;

/**
 * Created by tatyana.letschenok on 3/24/2015.
 */
public class MyClassTest {
    @Test
    public void notNil() throws Exception {
        MyClass tmp = new MyClass();
        Assert.assertNotNull(tmp);
    }

    @Test
    public void testFirstMethod() throws Exception {
        MyClass tmp = new MyClass();
        Assert.assertEquals(tmp.firstMethod(), 1);
    }

    @Test
    public void testSecondMethod() throws Exception {
        MyClass tmp = new MyClass();
        tmp.secondMethod();
        Assert.assertEquals(2, 2);
    }

}
