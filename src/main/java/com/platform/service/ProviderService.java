package com.platform.service;

import com.platform.model.Provider;
import com.platform.repository.ProviderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ProviderService {

    @Autowired
    private ProviderRepository providerRepository;

    public List<Provider> getAllProviders() {
        return providerRepository.findAll();
    }

    public Provider saveProvider(Provider provider) {
        return providerRepository.save(provider);
    }

    public boolean providerExists(String email) {
        return providerRepository.findByEmail(email).isPresent();
    }

    public Optional<Provider> getProviderById(Long id) {
        return providerRepository.findById(id);
    }

    public Provider authenticate(String email, String password) {
        Optional<Provider> provider = providerRepository.findByEmail(email);
        if (provider.isPresent() && provider.get().getPassword().equals(password)) {
            return provider.get();
        }
        return null;
    }

    public void approveProvider(Long id) {
        providerRepository.findById(id).ifPresent(provider -> {
            provider.setApproved(true);
            providerRepository.save(provider);
        });
    }

    public void deleteProvider(Long id) {
        providerRepository.deleteById(id);
    }
}
