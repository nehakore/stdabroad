        </div> <!-- end fade up div -->
    </main> <!-- end main-content -->
</div> <!-- end dashboard-wrapper -->

<!-- Document Viewer Modal (Shared across admin pages) -->
<div class="modal fade document-preview-modal" id="docModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-xl modal-dialog-centered">
        <div class="modal-content shadow-lg">
            <div class="modal-header">
                <h5 class="modal-title fw-bold"><i class="fas fa-file-search me-2"></i> Provider Verification Documents</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body p-4 bg-light">
                <div class="row g-4">
                    <div class="col-md-6">
                        <div class="card border-0 shadow-sm h-100">
                            <div class="card-header bg-white fw-bold text-center py-3">Government ID Proof</div>
                            <div class="card-body p-0 d-flex justify-content-center align-items-center" style="min-height: 400px; background: #f3f4f6;">
                                <div id="govIdContainer" class="w-100 h-100 text-center p-3"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card border-0 shadow-sm h-100">
                            <div class="card-header bg-white fw-bold text-center py-3">Business Registration Certificate</div>
                            <div class="card-body p-0 d-flex justify-content-center align-items-center" style="min-height: 400px; background: #f3f4f6;">
                                <div id="businessCertContainer" class="w-100 h-100 text-center p-3"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer bg-white border-top-0">
                <button type="button" class="btn btn-secondary rounded-pill px-4" data-bs-dismiss="modal">Close Viewer</button>
            </div>
        </div>
    </div>
</div>

<script>
    function renderDocument(url, containerId) {
        const container = document.getElementById(containerId);
        container.innerHTML = ''; // clear

        if (!url || url === 'null' || url === '') {
            container.innerHTML = '<div class="d-flex flex-column align-items-center justify-content-center h-100 py-5 text-muted"><i class="fas fa-file-times fs-1 mb-3"></i><p>Document not uploaded</p></div>';
            return;
        }

        const ext = url.split('.').pop().toLowerCase();
        
        if (ext === 'pdf') {
            container.innerHTML = '<iframe src="' + url + '" width="100%" height="400px" style="border:none;"></iframe>';
        } else if (['jpg', 'jpeg', 'png', 'gif'].includes(ext)) {
            container.innerHTML = '<img src="' + url + '" style="max-width:100%; max-height:400px; object-fit:contain; border-radius:8px;">';
        } else {
            container.innerHTML = '<div class="text-center py-5"><a href="' + url + '" target="_blank" class="btn btn-primary rounded-pill"><i class="fas fa-download me-2"></i>Download Document</a></div>';
        }
    }

    function viewDocuments(govIdUrl, businessCertUrl) {
        var myModal = new bootstrap.Modal(document.getElementById('docModal'));
        myModal.show();
        renderDocument(govIdUrl, 'govIdContainer');
        renderDocument(businessCertUrl, 'businessCertContainer');
    }
</script>

<jsp:include page="../common/footer.jsp">
    <jsp:param name="hideFooter" value="true" />
</jsp:include>
