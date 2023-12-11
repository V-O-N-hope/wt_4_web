package com.example.test1.service;

import com.example.test1.models.Image;
import com.example.test1.models.Product;
import com.example.test1.repositories.ProductRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class ProductService {
    private final ProductRepository productRepository;

    public List<Product> listProducts(String title) {
        if (title != null) return productRepository.findByTitle(title);
        return productRepository.findAll();
    }

    public void saveProduct(Product product, MultipartFile file1,MultipartFile file2, MultipartFile file3 ) throws IOException{
        Image image1 = null;
        Image image2 = null;
        Image image3 = null;

        if (file1.getSize() != 0){
            image1 = toImageEntity(file1);
            image1.setPreviewImage(true);
            product.addImageToProduct(image1);
        }

        if (file2.getSize() != 0){
            image2 = toImageEntity(file2);
            product.addImageToProduct(image2);
        }

        if (file3.getSize() != 0){
            image3 = toImageEntity(file3);
            product.addImageToProduct(image3);
        }

        log.info("Saving new Product. Title: {}; Author:{}", product.getTitle(), product.getAuthor());

        Product productFromDb = productRepository.save(product);

        if(image1 != null || image2 != null || image3 != null)
            productFromDb.setPreviewImageId(productFromDb.getImages().get(0).getId());

        productRepository.save(product);
    }

    private Image toImageEntity(MultipartFile file) throws IOException {
        Image image = new Image();
        image.setName(file.getName());
        image.setOriginalFileName(file.getOriginalFilename());
        image.setContentType(file.getContentType());
        image.setSize(file.getSize());
        image.setBytes(file.getBytes());
        return image;
    }

    public void deleteProduct(Long id) {
        productRepository.deleteById(id);
    }

    public Product getProductById(Long id) {
        return productRepository.findById(id).orElse(null);
    }
}