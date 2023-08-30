package learn.cart.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;

@Entity
public class Products {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int pId;
	private String pName;
	@Column(length = 1500)
	private String pDiscrip;
	private String pPic;
	private int pPrice;
	private int pDiscount;
	private int PQuntity;
	@ManyToOne
	private Category  category;
	public Products() {
		super();
	}
	public Products(String pName, String pDiscrip, String pPic, int pPrice, int pDiscount, int pQuntity,Category category) {
		super();
		this.pName = pName;
		this.pDiscrip = pDiscrip;
		this.pPic = pPic;
		this.pPrice = pPrice;
		this.pDiscount = pDiscount;
		this.PQuntity = pQuntity;
		this.category=category;
	}
	public int getpId() {
		return pId;
	}
	public void setpId(int pId) {
		this.pId = pId;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public String getpDiscrip() {
		return pDiscrip;
	}
	public void setpDiscrip(String pDiscrip) {
		this.pDiscrip = pDiscrip;
	}
	public String getpPic() {
		return pPic;
	}
	public void setpPic(String pPic) {
		this.pPic = pPic;
	}
	public int getpPrice() {
		return pPrice;
	}
	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}
	public int getpDiscount() {
		return pDiscount;
	}
	public void setpDiscount(int pDiscount) {
		this.pDiscount = pDiscount;
	}
	public int getPQuntity() {
		return PQuntity;
	}
	public void setPQuntity(int pQuntity) {
		PQuntity = pQuntity;
	}
	
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	@Override
	public String toString() {
		return "Products [pId=" + pId + ", pName=" + pName + ", pDiscrip=" + pDiscrip + ", pPic=" + pPic + ", pPrice="
				+ pPrice + ", pDiscount=" + pDiscount + ", PQuntity=" + PQuntity + "]";
	}
   
	//calculate price after discount
	public int getPriceAfterApplyingDiscount() {
		
		int d= (int)((this.pDiscount/100.0)*this.pPrice);
		return this.pPrice-d;
	}
	
	
	
}
