package com.javaweb.builder;

public class ProductSearchBuilder {
	
	private String name;
	private String category;
	private String brand;
	private String cpu;
	private String gpu;
	private String rom;
	private String ram;
	
	
	
	
	public ProductSearchBuilder(Builder builder) {
		super();
		this.name = builder.name;
		this.category = builder.category;
		this.brand = builder.brand;
		this.cpu = builder.cpu;
		this.gpu = builder.gpu;
		this.rom = builder.rom;
		this.ram = builder.ram;
		
	}
	
	
	
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
	
	
	public static class Builder{
		private String name;
		private String category;
		private String brand;
		private String cpu;
		private String gpu;
		private String rom;
		private String ram;
		
		public Builder setName(String name) {
			this.name = name;
			return this;
		}
		public Builder setCategory(String category) {
			this.category = category;
			return this;
		}
		public Builder setBrand(String brand) {
			this.brand = brand;
			return this;
		}
		public Builder setCpu(String cpu) {
			this.cpu = cpu;
			return this;
		}
		public Builder setGpu(String gpu) {
			this.gpu = gpu;
			return this;
		}
		public Builder setRom(String rom) {
			this.rom = rom;
			return this;
		}
		public Builder setRam(String ram) {
			this.ram = ram;
			return this;
		}
		
		public ProductSearchBuilder build() {
			return new ProductSearchBuilder(this);
		}
		
		
		
	}
	
	
	

}
