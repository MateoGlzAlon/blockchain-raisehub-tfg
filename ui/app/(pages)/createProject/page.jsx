"use client";
import React, { useState, useEffect } from 'react';
import { DATA } from '@/app/data';
import createProjectPOST from '@/components/fetchComponents/POST/createProjectPOST';
import PageFrame from '@/components/generalComponents/pageFrame/PageFrame';
import { useRouter } from 'next/navigation';
import TokenManager from '@/app/apis/TokenManager';
import { useDynamicContext } from "@dynamic-labs/sdk-react-core";

function CreateProjectPage() {
    const router = useRouter();
    const { primaryWallet } = useDynamicContext();

    // ✅ Ensure primaryWallet is only used after mounting to avoid hydration issues
    const [isClient, setIsClient] = useState(false);
    const [usePrimary, setUsePrimary] = useState(true);
    const [formData, setFormData] = useState({
        name: '',
        description: '',
        location: '',
        type: '',
        dateCreated: '',
        fundingGoal: '',
        userId: '',
        creatorWallet: ''
    });

    const [images, setImages] = useState([]);
    const [imagePreviews, setImagePreviews] = useState([]);

    useEffect(() => {
        setIsClient(true);
        setFormData(prevData => ({
            ...prevData,
            creatorWallet: primaryWallet?.address || ''
        }));
    }, [primaryWallet]);

    const handleChange = (e) => {
        const { name, value } = e.target;
        setFormData((prevData) => ({ ...prevData, [name]: value }));
    };

    const handleWalletToggle = () => {
        setUsePrimary(!usePrimary);
        setFormData((prevData) => ({
            ...prevData,
            creatorWallet: usePrimary ? '' : primaryWallet?.address || ''
        }));
    };

    const handleSubmit = async (e) => {
        e.preventDefault();


        console.log("formData antes update:", formData);

        const updatedFormData = {
            ...formData,
            dateCreated: new Date().toISOString(),
            userId: TokenManager.getClaims().userId
        };

        try {
            const res = await createProjectPOST(updatedFormData, images);
            router.push(`/projects/${res}`);
        } catch (error) {
            console.error('Error creating project with data:', updatedFormData, error);
        }
    };


    const handleImageChange = (e) => {
        const files = Array.from(e.target.files);
        if (files.length + images.length > 3) {
            alert('You can upload up to 3 images only.');
            return;
        }
        const newImages = [...images, ...files];
        const previews = newImages.map((file) => URL.createObjectURL(file));
        setImages(newImages);
        setImagePreviews(previews);
    };

    if (!isClient) {
        return (
            <PageFrame>
                <div className="min-h-screen flex justify-center items-center">
                    <p className="text-lg font-semibold">Loading...</p>
                </div>
            </PageFrame>
        );
    }

    return (
        <PageFrame>
            <div className="min-h-screen flex justify-center items-center p-6">
                <div className="w-full max-w-4xl bg-white rounded-lg border-4 p-8">
                    <h1 className="text-3xl font-bold text-center mb-6">New Project</h1>

                    <form onSubmit={handleSubmit} className="space-y-6">
                        <div className="grid grid-cols-1 sm:grid-cols-2 gap-6">
                            <div>
                                <label className="block text-gray-700 font-medium">Project Name</label>
                                <input
                                    type="text"
                                    name="name"
                                    value={formData.name}
                                    onChange={handleChange}
                                    className="w-full px-4 py-3 border rounded-lg mt-2 focus:outline-none focus:ring-2 focus:ring-indigo-600"
                                    placeholder="Enter project name"
                                    required
                                />
                            </div>

                            <div>
                                <label className="block text-gray-700 font-medium">Location</label>
                                <input
                                    type="text"
                                    name="location"
                                    value={formData.location}
                                    onChange={handleChange}
                                    className="w-full px-4 py-3 border rounded-lg mt-2 focus:outline-none focus:ring-2 focus:ring-indigo-600"
                                    placeholder="Enter project location"
                                    required
                                />
                            </div>
                        </div>

                        <div>
                            <label className="block text-gray-700 font-medium">Description</label>
                            <textarea
                                name="description"
                                value={formData.description}
                                onChange={handleChange}
                                className="w-full px-4 py-3 border rounded-lg mt-2 focus:outline-none focus:ring-2 focus:ring-indigo-600"
                                placeholder="Describe your project"
                                rows="4"
                                required
                            />
                        </div>

                        <div className="grid grid-cols-1 sm:grid-cols-2 gap-6">
                            <div>
                                <label className="block text-gray-700 font-medium">Category</label>
                                <select
                                    name="type"
                                    value={formData.type}
                                    onChange={handleChange}
                                    className="w-full px-4 py-3 border rounded-lg mt-2 focus:outline-none focus:ring-2 focus:ring-indigo-600"
                                    required
                                >
                                    <option value="">Select a category</option>
                                    {DATA.projectTypes.map((item) => (
                                        <option value={item} key={item}>
                                            {item}
                                        </option>
                                    ))}
                                </select>
                            </div>

                            <div>
                                <label className="block text-gray-700 font-medium">Funding Goal</label>
                                <input
                                    type="number"
                                    name="fundingGoal"
                                    value={formData.fundingGoal}
                                    onChange={handleChange}
                                    className="w-full px-4 py-3 border rounded-lg mt-2 focus:outline-none focus:ring-2 focus:ring-indigo-600"
                                    placeholder="Enter fundraising goal"
                                    required
                                />
                            </div>
                        </div>

                        {/* Wallet Address Section */}
                        <div>
                            <label className="block text-gray-700 font-medium">Wallet Address</label>
                            <div className="flex items-center justify-between p-3 mt-2 border-2 border-indigo-600 rounded-lg bg-gray-100 dark:bg-gray-800">
                                {usePrimary ? (
                                    <span className="truncate text-gray-800 dark:text-white font-mono">
                                        {primaryWallet?.address || "No wallet connected"}
                                    </span>
                                ) : (
                                    <input
                                        type="text"
                                        name="creatorWalletAdress"
                                        value={formData.creatorWallet}
                                        onChange={handleChange}
                                        className="w-full px-2 py-1 bg-transparent outline-none font-mono text-gray-800 dark:text-white"
                                        placeholder="Enter wallet address"
                                        required={!usePrimary}
                                    />
                                )}
                                {formData.creatorWallet && (
                                    <button
                                        onClick={() => navigator.clipboard.writeText(formData.creatorWallet)}
                                        className="ml-2 px-2 py-1 text-xs font-semibold text-indigo-600 hover:text-indigo-800 dark:hover:text-indigo-400 transition"
                                    >
                                        Copy
                                    </button>
                                )}
                            </div>
                            <button
                                onClick={handleWalletToggle}
                                className="mt-2 text-sm text-indigo-600 hover:text-indigo-800 dark:hover:text-indigo-400 transition"
                                type="button"
                            >
                                {usePrimary ? "Enter manually" : "Use primary wallet"}
                            </button>
                        </div>

                        <div>
                            <label className="block text-gray-700 font-medium">Project Images (Up to 3)</label>
                            <input
                                type="file"
                                name="images"
                                onChange={handleImageChange}
                                className="w-full px-4 py-3 border rounded-lg mt-2 focus:outline-none"
                                accept="image/*"
                                multiple
                                required
                            />
                            <div className="flex mt-4 gap-4">
                                {imagePreviews.map((preview, index) => (
                                    <img
                                        key={index}
                                        src={preview}
                                        alt={`preview-${index}`}
                                        className="w-24 h-24 object-cover rounded-lg border"
                                    />
                                ))}
                            </div>
                        </div>

                        <div className="text-center mt-6">
                            <button
                                type="submit"
                                className="px-8 py-4 bg-indigo-600 text-white font-semibold rounded-lg hover:bg-indigo-700 transition duration-300"
                            >
                                Create Project
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </PageFrame>
    );
}

export default CreateProjectPage;
