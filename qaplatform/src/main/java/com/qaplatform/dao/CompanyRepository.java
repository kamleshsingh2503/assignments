package com.qaplatform.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.qaplatform.models.Company;

@Repository
public interface CompanyRepository extends JpaRepository<Company, Long>{

}
