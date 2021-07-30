package com.colo.domain;

public class ProductVO {
   private int pno;  
   private String category;  
   private String brand;  
   private String title;  
   private String content;  
   private String regdate;
   private String imgfile;  
   private int price;  
   private int point;  

   public ProductVO() {}

   // insert
   public ProductVO(String category, String brand, String title, String content, String imgfile, int price, int point) {
      this.category = category;
      this.brand = brand;
      this.title = title;
      this.content = content;
      this.imgfile = imgfile;
      this.price = price;
      this.point = point;
   }

   // list
   public ProductVO(int pno, String category, String title, String imgfile, int price) {
      this.pno = pno;
      this.category = category;
      this.title = title;
      this.imgfile = imgfile;
      this.price = price;
   }

   // update
   public ProductVO(int pno, String category, String brand, String title, String content, String imgfile, int price,
         int point) {
      this.pno = pno;
      this.category = category;
      this.brand = brand;
      this.title = title;
      this.content = content;
      this.imgfile = imgfile;
      this.price = price;
      this.point = point;
   }
   
   // detail
   public ProductVO(int pno, String category, String brand, String title, String content, String regdate,
         String imgfile, int price, int point) {
      this.pno = pno;
      this.category = category;
      this.brand = brand;
      this.title = title;
      this.content = content;
      this.regdate = regdate;
      this.imgfile = imgfile;
      this.price = price;
      this.point = point;
   }

   public int getPno() {
      return pno;
   }

   public void setPno(int pno) {
      this.pno = pno;
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

   public String getTitle() {
      return title;
   }

   public void setTitle(String title) {
      this.title = title;
   }

   public String getContent() {
      return content;
   }

   public void setContent(String content) {
      this.content = content;
   }

   public String getRegdate() {
      return regdate;
   }

   public void setRegdate(String regdate) {
      this.regdate = regdate;
   }

   public String getImgfile() {
      return imgfile;
   }

   public void setImgfile(String imgfile) {
      this.imgfile = imgfile;
   }

   public int getPrice() {
      return price;
   }

   public void setPrice(int price) {
      this.price = price;
   }

   public int getPoint() {
      return point;
   }

   public void setPoint(int point) {
      this.point = point;
   }

   @Override
   public String toString() {
      return "ProductVO [pno=" + pno + ", category=" + category + ", brand=" + brand + ", title=" + title
            + ", content=" + content + ", regdate=" + regdate + ", imgfile=" + imgfile + ", price=" + price
            + ", point=" + point + "]";
   }

}