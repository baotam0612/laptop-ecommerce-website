package com.javaweb.model.response;

import com.javaweb.model.dto.AbstractDTO;

public class ProductSearchResponse extends AbstractDTO {
	
	private String name;
	private String category;
	private String brand;
	private String cpu;
	private String gpu;
	private String rom;
	private String ram;
	private String price;

    public String getImagespath() {
        return imagespath;
    }

    public void setImagespath(String imagespath) {
        this.imagespath = imagespath;
    }

    private String imagespath;

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getCpu() {
		return cpu;
	}
	public void setCpu(String cpu) {
		this.cpu = cpu;
	}
	public String getGpu() {
		return gpu;
	}
	public void setGpu(String gpu) {
		this.gpu = gpu;
	}
	public String getRom() {
		return rom;
	}
	public void setRom(String rom) {
		this.rom = rom;
	}
	public String getRam() {
		return ram;
	}
	public void setRam(String ram) {
		this.ram = ram;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	
	

}
