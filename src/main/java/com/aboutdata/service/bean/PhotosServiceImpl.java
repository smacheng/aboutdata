package com.aboutdata.service.bean;

import com.aboutdata.commons.enums.PhotoStatus;
import com.aboutdata.dao.PhotosDao;
import com.aboutdata.domain.Photos;
import com.aboutdata.domain.Tag;
import com.aboutdata.model.PhotosModel;
import com.aboutdata.model.dto.PhotosDTO;
import com.aboutdata.service.PhotosService;
import com.aboutdata.service.TagService;

import java.util.Collections;
import java.util.List;
import java.util.Set;
import javax.annotation.Resource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author youyou
 */
@Service("photosServiceImpl")
public class PhotosServiceImpl implements PhotosService {

	Logger logger = LoggerFactory.getLogger(PhotosServiceImpl.class);

	@Resource
	private PhotosDao photosDao;

	@Resource
	private TagService tagService;

	@Override
	@Transactional
	public Photos get(String id) {
		Photos photo = photosDao.findOne(id);

		return photo;
	}

	@Override
	public Page<PhotosModel> findByStatus(PhotoStatus status, Pageable pageable) {

		Page<Photos> page = photosDao.findByStatus(status, pageable);

		List<Photos> photos = page.getContent();

		List<PhotosModel> models = PhotosDTO.getPhotosModeslDTO(photos);
		Page<PhotosModel> result = new PageImpl<PhotosModel>(models, pageable, page.getTotalElements());

		return result;
	}

	@Override
	public Page<PhotosModel> find(Pageable pageable) {
		Page<Photos> page = photosDao.findAll(pageable);
		List<Photos> photos = page.getContent();

		List<PhotosModel> models = PhotosDTO.getPhotosModeslDTO(photos);
		Page<PhotosModel> result = new PageImpl<PhotosModel>(models, pageable, page.getTotalElements());

		return result;
	}

	public List<Photos> findTop10() {

		int pageNow = 1;
		int pageSize = 10;

		Pageable pageable = new PageRequest((pageNow - 1) * pageSize, pageSize);
		Page<Photos> page = photosDao.findAll(pageable);

		for (Photos p : page.getContent()) {
			logger.info("top10 {}", p);
		}

		return page.getContent();
	}

	@Override
	public List<Photos> findPhotosAndTags() {
		List<Photos> all = photosDao.findAll();
		return all;
	}

	@Override
	@Transactional
	public void addTags(String id, String tagString) {
		Set<Tag> tags = tagService.getTagsFromString(tagString);
		Photos photos = photosDao.findOne(id);
		logger.info("top10  tags {}", tags.size());
		photos.setTags(tags);
		photosDao.save(photos);
	}

	@Override
	public List<Photos> findByAlbumId(String albumId) {
		return photosDao.findByAlbumId(albumId);
	}

	@Override
	public PhotosModel findById(String id) {
		Photos photos = photosDao.findOne(id);
		return PhotosDTO.getPhotosModelDTO(photos);
	}

	@Override
	@Transactional
	public Photos create(Photos photos) {

		return photosDao.save(photos);
	}

	@Override
	@Transactional
	public int makrStatus(String id, PhotoStatus status) {
		return photosDao.makrStatus(id, status);
	}

	@Override
	public List<PhotosModel> random() {
		
		List<String> ids = photosDao.findAllIds();
		/***
		 * 1 打乱顺序 造成随机效果 也要分页 
		 * 2 分頁每次不是同一個隨機序列 每次分頁都是已給新的隨機隊列
		 * 
		 */
		Collections.shuffle(ids);
		//取出24条记录
		List<Photos> photos = photosDao.findByIds(ids.subList(0, 24));
		
		List<PhotosModel> result = PhotosDTO.getPhotosModeslDTO(photos);
		
		return result;
	}
}
