package com.platform.component;

import com.platform.model.Country;
import com.platform.repository.CountryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import java.util.Arrays;
import java.util.List;

@Component
public class DataSeeder implements CommandLineRunner {

    @Autowired
    private CountryRepository countryRepository;

    @Autowired
    private org.springframework.jdbc.core.JdbcTemplate jdbcTemplate;

    @Override
    public void run(String... args) throws Exception {
        // Fix column types that hibernate update doesn't alter from varchar to text
        try {
            jdbcTemplate.execute("ALTER TABLE universities MODIFY description TEXT");
            jdbcTemplate.execute("ALTER TABLE universities MODIFY address TEXT");
            jdbcTemplate.execute("ALTER TABLE universities MODIFY required_documents TEXT");
            jdbcTemplate.execute("ALTER TABLE universities MODIFY top_recruiters TEXT");
            jdbcTemplate.execute("ALTER TABLE universities MODIFY images_gallery TEXT");
            jdbcTemplate.execute("ALTER TABLE universities MODIFY google_maps_link TEXT");
            System.out.println("Successfully updated university columns to TEXT type.");
        } catch (Exception e) {
            System.out.println("Alter table failed (might already be TEXT or table missing): " + e.getMessage());
        }

        // Seed Countries if empty
        if (countryRepository.count() == 0) {
            List<String> countryNames = Arrays.asList(
                    "United States",
                    "United Kingdom",
                    "Canada",
                    "Australia",
                    "Germany",
                    "Ireland",
                    "New Zealand",
                    "France",
                    "Singapore",
                    "Netherlands",
                    "Sweden",
                    "Switzerland",
                    "Italy",
                    "Spain",
                    "Japan",
                    "South Korea",
                    "India"
            );

            for (String name : countryNames) {
                Country c = new Country();
                c.setName(name);
                c.setDescription("Study in " + name);
                c.setImageUrl("https://images.unsplash.com/photo-1523050854058-8df90110c9f1?w=800&q=80"); // Generic placeholder
                countryRepository.save(c);
            }
            
            System.out.println("Seeded " + countryNames.size() + " countries into the database.");
        }
    }
}
