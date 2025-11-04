package com.javaweb.repository.custom.Impl;

import com.javaweb.entity.CustomerEntity;
import com.javaweb.repository.CustomerRepository;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

public class CustomerRepositoryImpl implements CustomerRepository {

    @PersistenceContext
    private EntityManager entityManager;


    @Override
    public List<CustomerEntity> findByUserId(Long userId) {
        String sql = "SELECT * FROM customer WHERE user_id = "+userId;
        Query query = entityManager.createNativeQuery(sql, CustomerEntity.class);
        return query.getResultList();
    }

    @Override
    public List<CustomerEntity> findAll() {
        return Collections.emptyList();
    }

    @Override
    public List<CustomerEntity> findAll(Sort sort) {
        return Collections.emptyList();
    }

    @Override
    public Page<CustomerEntity> findAll(Pageable pageable) {
        return null;
    }

    @Override
    public List<CustomerEntity> findAllById(Iterable<Long> longs) {
        return Collections.emptyList();
    }

    @Override
    public long count() {
        return 0;
    }

    @Override
    public void deleteById(Long aLong) {

    }

    @Override
    public void delete(CustomerEntity entity) {

    }

    @Override
    public void deleteAll(Iterable<? extends CustomerEntity> entities) {

    }

    @Override
    public void deleteAll() {

    }

    @Override
    public <S extends CustomerEntity> S save(S entity) {
        return null;
    }

    @Override
    public <S extends CustomerEntity> List<S> saveAll(Iterable<S> entities) {
        return Collections.emptyList();
    }

    @Override
    public Optional<CustomerEntity> findById(Long aLong) {
        return Optional.empty();
    }

    @Override
    public boolean existsById(Long aLong) {
        return false;
    }

    @Override
    public void flush() {

    }

    @Override
    public <S extends CustomerEntity> S saveAndFlush(S entity) {
        return null;
    }

    @Override
    public void deleteInBatch(Iterable<CustomerEntity> entities) {

    }

    @Override
    public void deleteAllInBatch() {

    }

    @Override
    public CustomerEntity getOne(Long aLong) {
        return null;
    }

    @Override
    public <S extends CustomerEntity> Optional<S> findOne(Example<S> example) {
        return Optional.empty();
    }

    @Override
    public <S extends CustomerEntity> List<S> findAll(Example<S> example) {
        return Collections.emptyList();
    }

    @Override
    public <S extends CustomerEntity> List<S> findAll(Example<S> example, Sort sort) {
        return Collections.emptyList();
    }

    @Override
    public <S extends CustomerEntity> Page<S> findAll(Example<S> example, Pageable pageable) {
        return null;
    }

    @Override
    public <S extends CustomerEntity> long count(Example<S> example) {
        return 0;
    }

    @Override
    public <S extends CustomerEntity> boolean exists(Example<S> example) {
        return false;
    }
}
