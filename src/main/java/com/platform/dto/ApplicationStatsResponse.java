package com.platform.dto;

public class ApplicationStatsResponse {
    private long total;
    private long underReview;
    private long accepted;
    private long rejected;
    private long offerReceived;

    public ApplicationStatsResponse() {}

    public ApplicationStatsResponse(long total, long underReview, long accepted, long rejected, long offerReceived) {
        this.total = total;
        this.underReview = underReview;
        this.accepted = accepted;
        this.rejected = rejected;
        this.offerReceived = offerReceived;
    }

    // Getters and Setters
    public long getTotal() { return total; }
    public void setTotal(long total) { this.total = total; }

    public long getUnderReview() { return underReview; }
    public void setUnderReview(long underReview) { this.underReview = underReview; }

    public long getAccepted() { return accepted; }
    public void setAccepted(long accepted) { this.accepted = accepted; }

    public long getRejected() { return rejected; }
    public void setRejected(long rejected) { this.rejected = rejected; }

    public long getOfferReceived() { return offerReceived; }
    public void setOfferReceived(long offerReceived) { this.offerReceived = offerReceived; }
}
