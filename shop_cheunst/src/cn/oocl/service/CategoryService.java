package cn.oocl.service;

import java.util.List;

import cn.oocl.model.Category;

public interface CategoryService {

	public Iterable<Category> queryAll();

	public Category save(Category category);

	public List<Category> queryByHot(char hot);
}