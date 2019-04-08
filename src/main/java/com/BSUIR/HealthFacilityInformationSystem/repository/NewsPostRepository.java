package com.BSUIR.HealthFacilityInformationSystem.repository;

import com.BSUIR.HealthFacilityInformationSystem.domain.NewsPost;
import com.BSUIR.HealthFacilityInformationSystem.domain.User;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface NewsPostRepository extends CrudRepository<NewsPost, Integer> {

    List<NewsPost> findByTag(final String doctor);
}
