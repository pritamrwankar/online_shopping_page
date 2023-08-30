package learn.cart.entities;

import java.util.ArrayList;
import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;

@Entity
public class Category {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int categoryId;
	private String categorytitle;
	private String categoryDesc;
	@OneToMany(mappedBy = "category")
	private List<Products> product=new ArrayList<>();
	
	public Category(int categoryId, String categorytitle, String categoryDesc, List<Products> product) {
		super();
		this.categoryId = categoryId;
		this.categorytitle = categorytitle;
		this.categoryDesc = categoryDesc;
		this.product = product;
	}
	public Category(int categoryId, String categorytitle, String categoryDesc) {
		super();
		this.categoryId = categoryId;
		this.categorytitle = categorytitle;
		this.categoryDesc = categoryDesc;
	}
	public Category(String categorytitle, String categoryDesc) {
		super();
		this.categorytitle = categorytitle;
		this.categoryDesc = categoryDesc;
	}
	public Category() {
		super();
	}
	
	public List<Products> getProduct() {
		return product;
	}
	public void setProduct(List<Products> product) {
		this.product = product;
	}
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	public String getCategorytitle() {
		return categorytitle;
	}
	public void setCategorytitle(String categorytitle) {
		this.categorytitle = categorytitle;
	}
	public String getCategoryDesc() {
		return categoryDesc;
	}
	public void setCategoryDesc(String categoryDesc) {
		this.categoryDesc = categoryDesc;
	}
	@Override
	public String toString() {
		return "Category [categoryId=" + categoryId + ", categorytitle=" + categorytitle + ", categoryDesc="
				+ categoryDesc + "]";
	}
	  

}
