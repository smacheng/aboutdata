/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aboutdata.service;

import com.aboutdata.domain.Photos;
import java.util.List;

/**
 *
 * @author youyou
 */
public interface PhotosService {

    public List<Photos> findTop50();

    public List<Photos> findTop10();

}