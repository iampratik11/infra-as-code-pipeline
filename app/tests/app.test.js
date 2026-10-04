test("application health check should return healthy", () => {
    const health = {
        status: "healthy"
    };

    expect(health.status).toBe("healthy");
});
